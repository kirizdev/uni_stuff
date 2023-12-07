require 'nokogiri'
require 'open-uri'
require 'csv'

HOSPITALS_URL = 'https://www.hospitalsafetygrade.org/all-hospitals'.freeze
CSV_FILE = 'hospitals.csv'.freeze

def fetch_hospital_names(url)
  html = URI.open(url)
  doc = Nokogiri::HTML(html)
  hospital_names = []

  doc.css('div#BlinkDBContent_849210 ul li a').each do |hospital|
    hospital_names << hospital.text
  end

  hospital_names
end

def write_to_csv(file, hospital_names)
  CSV.open(file, 'w') do |csv|
    csv << ['ID', 'Hospital Name']

    hospital_names.each_with_index do |hospital_name, index|
      csv << [index + 1, hospital_name]
    end
  end
end

hospital_names = fetch_hospital_names(HOSPITALS_URL)
puts "Writing to #{CSV_FILE}..."
write_to_csv(CSV_FILE, hospital_names)
puts "hospital_names length: #{hospital_names.length}"
