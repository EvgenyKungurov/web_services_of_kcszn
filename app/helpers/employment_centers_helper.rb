module EmploymentCentersHelper
  def total_amount(user)
    user.select { |k, _| k.start_with? 'SUM' }.values.map(&:to_f).sum.round(2)
  end

  def table_money_monthly(user, date)
    half_year = get_last_half_year(date)
    money_monthly = user.select { |k| k.start_with? 'SUM' }.values.map(&:to_f)
    content_tag(:table, 'class' => 'table') do
      output = ''
      output += content_tag(:tr)
      half_year.map { |month| output += content_tag(:th, month) }
      output += content_tag(:tr)
      money_monthly.map { |sum| output += content_tag(:td, sum) }
      output.html_safe
    end
  end

  def print_spravka(user)
    "print_spravka(#{user['NUMK'].split('/').first})"
  end

  def get_last_half_year(date)
    months = %w(Январь Февраль Март Апрель Май Июнь Июль
                Август Сентябрь Октябрь Ноябрь Декабрь)
    month = Date.parse(date).month
    first_month = month - 6
    if first_month.positive?
      months[month - 6..month - 1]
    else
      months.last(6 - first_month.abs) + months.first(first_month.abs)
    end
  end
end
