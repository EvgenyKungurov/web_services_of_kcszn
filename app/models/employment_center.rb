class EmploymentCenter < ApplicationRecord
  YEAR  = Time.now.year.to_s.freeze
  MONTH = Time.now.month.to_s.freeze
  TIME  = Time.now.strftime('%d-%m-%Y_%H:%M').freeze

  class << self
    def current_user
      Thread.current[:user]
    end

    def current_user=(user)
      Thread.current[:user] = user
    end

    def parse_document(dbf)
      data = DBF::Table.new(StringIO.new(dbf))
      data_hash = {}
      data.map { |row| data_hash[data_hash.size + 1] = encode(row) }
      data_hash
    end

    def find_user(user)
      fm = user.split.first
      users = {}
      Dir["#{current_folder}/*"].each do |file|
        file_name = file.split('/').last
        next unless file_name.start_with? 'resp'
        file = File.read(file)
        users[file_name] = YAML.load(file).select { |_, v| v['FM'].casecmp(fm).zero? }
      end
      users.reject { |_, v| v.empty? }
    end

    def create_structure_folders(file)
      create_user_root_folder
      create_year
      create_month
      file = "#{file.original_filename.split('.').first}_#{TIME}.yml"
      Rails.root.join('public', current_user.email, YEAR, MONTH, file)
    end

    private

    def encode(data)
      Hash[data.attributes.map { |k, v| [k, v.force_encoding('cp866').encode('utf-8')] }]
    end

    def current_folder
      Rails.root.join('public', current_user.email, YEAR, MONTH)
    end

    def create_user_root_folder
      check_dir(Rails.root.join('public', current_user.email))
    end

    def create_year
      check_dir(Rails.root.join('public', current_user.email, YEAR))
    end

    def create_month
      check_dir(Rails.root.join('public', current_user.email, YEAR, MONTH))
    end

    def check_dir(dir)
      Dir.mkdir(dir) unless Dir.exist? dir
    end
  end
end
