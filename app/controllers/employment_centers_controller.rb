class EmploymentCentersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :check_files, only: [:upload]
  before_action :check_user, only: [:find]
  before_action :set_current_user, only: [:upload, :find]

  def index
  end

  def find
    @users = EmploymentCenter.find_user(employment_centers_params[:user])
    if @users.empty?
      flash[:notice] = 'Человек не найден, возможно он не стоит на учете'
      redirect_to employment_centers_path
    end
  end

  def upload
    params[:files].each do |file|
      folder = EmploymentCenter.create_structure_folders(file)
      File.open(folder, 'wb') do |new_file|
        new_file.write(YAML.dump(EmploymentCenter.parse_document(file.read)))
      end
    end
    flash[:notice] = 'Документ успешно загружен'
    redirect_to employment_centers_path
  end

  private

  def employment_centers_params
    params.require(:employment_centers).permit(:user)
  end

  def check_files
    unless params.include? :files
      flash[:notice] = 'Произошла ошибка, попробуйте снова'
      redirect_to new_employment_center_path
    end
  end

  def check_user
    if employment_centers_params[:user].empty?
      @users = {}
      flash[:notice] = 'Человек не найден, возможно он не стоит на учете'
      redirect_to employment_centers_path
    end
  end

  def set_current_user
    EmploymentCenter.current_user = current_user
  end
end
