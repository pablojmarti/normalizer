require 'csv'

class CSVParser

  def parse_input(input_csv)
    begin 
      return parsed_csv = CSV.parse(input_csv, headers: true, encoding:'utf-8')
    rescue => e
      $stderr.puts e
    end
  end

  def create_stdout_csv(headers, output)
    # returns generated CSV from given headers and output code("UTF-8")
    # first we add the headers to the csv, then
    # we iterate over the array of hashes and add the values of
    # each hash to the csv file
    return CSV.generate do |csv|
      csv << headers
      output.each do |h|
        csv << h.values
      end
    end
  end

end
