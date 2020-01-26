require 'date'

class DataNormalizer

  def normalize_duration(duration) 

    # using this milliseconds converter array which has the conversions for milliseconds in this order:
    # hour, minutes, seconds, ms
    # we will split the duration into an array on the separators :,.
    # from there we will loop through with the index which matches the conversion table and multiple the
    # value by the conversion and at the end add up the total 
    milliseconds_converter = [3600000, 60000, 1000, 1]

    begin
      duration_a = duration.split(/[:\.]/)
      ms = duration_a.each_with_index.map {|time,i| time.to_i * milliseconds_converter[i]}.inject(0, :+)
    rescue => e
      $stderr.puts e
    end

    return ms
  end

  def normalize_data(parsed_csv)

    # In this function we create an empty output array 
    # and loop through the parsed csv and normalize the data on each header
    # for each row we create a new hash that will be pushed to the output array
    output_array = []
    parsed_csv.each do |row|
      output_csv = {} 
      output_csv[:Timestamp] = normalize_timestamp(row["Timestamp"]) 
      output_csv[:Address] = row["Address"]
      output_csv[:ZIP] = normalize_zip(row["ZIP"])
      output_csv[:FullName] = normalize_full_name(row["FullName"])
      output_csv[:FooDuration] = normalize_duration(row["FooDuration"])
      output_csv[:BarDuration] = normalize_duration(row["BarDuration"])
      output_csv[:TotalDuration] = output_csv[:FooDuration].to_i + output_csv[:BarDuration].to_i
      output_csv[:Notes] = row["Notes"]

      output_array.push(output_csv)
    end

    return output_array
  end

  def normalize_timestamp(timestamp)
    # here we interpolate the timezone (US /PST) to be included in the row and then call 
    # new offset to get the time zone to be in US/EST
    # convert to string from date time and then encode to utf-8
    return DateTime.strptime("#{timestamp}-800", '%m/%d/%y %H:%M:%S %p%z').new_offset("-500").to_s.encode("UTF-8")
  end

  def normalize_zip(zip)
    # multiply the string 0 by the difference of 5 and the length of the original zip code, 
    # which then gets prepended to the original zip code
    return ("0" * ( 5 - zip.length()) + zip).encode("UTF-8")
  end

  def normalize_full_name(full_name)
    return full_name.upcase
  end
end
