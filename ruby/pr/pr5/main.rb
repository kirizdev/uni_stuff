def valid_ipv4?(ip)
  parts = ip.split('.')

  return false unless parts.length == 4

  parts.all? do |segment|
    segment.to_i >= 0 && segment.to_i <= 255 && (segment.to_i.to_s == segment)
  end
end

puts valid_ipv4?('203.45.67.89')  
puts valid_ipv4?('11.22.33.44')     
puts valid_ipv4?('256.1.1.1')     
puts valid_ipv4?('1.1.1.1.1')     
puts valid_ipv4?('192.168.0.01')  

