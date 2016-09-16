module DBF
  class Column
    private

    def clean(value) # nodoc
      if value.encoding.to_s == 'ASCII-8BIT'
        value = value.strip.partition("\x00").first.force_encoding('cp1251').encode('utf-8')
        return 'FM'    if value == 'ФАМИЛИЯ'
        return 'IM'    if value == 'ИМЯ'
        return 'OT'    if value == 'ОТЧЕСТВО'
        return 'BIR'   if value == 'ДАТА_РОЖДЕ'
        return 'DOC'   if value == 'ВИД_УД_Я_Л'
        return 'SN'    if value == 'СЕРИЯ_УД_Л'
        return 'NUM'   if value == 'НОМЕР_УД_Л'
        return 'CITY'  if value == 'НАСЕЛЕННЫЙ'
        return 'ST'    if value == 'УЛИЦА'
        return 'HOUSE' if value == 'ДОМ'
        return 'KOR'   if value == 'КОРПУС'
        return 'KV'    if value == 'КВАРТИРА'
      else
        truncated_value = value.strip.partition("\x00").first
        truncated_value.gsub(/[^\x20-\x7E]/, '')
      end
    end
  end
end
