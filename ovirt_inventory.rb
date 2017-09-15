require 'json'

rFile = `curl --insecure -u "<admin username>@internal:<password for admin user>" -H "Content-Type: application/json" -H "Accept: application/json" -X GET <server_url>/ovirt-engine/api/vms`

parsed = JSON.parse(rFile).to_h

puts '<table><tbody><tr><th>Hostname</th><th>Host</th><th>Memory</th><th>CPU</th></tr>'

parsed.each do |array|
  i = array[1].count
  j = 0
  while j < i do
    if array[1]["#{j}".to_i]["fqdn"] && array[1]["#{j}".to_i]["status"] == "up"
      #puts "Array #{j.to_i}"
      #puts array[1]["#{j}".to_i]
      print "<tr><td>#{array[1]["#{j}".to_i]["fqdn"]}</td><td>#{array[1]["#{j}".to_i]["display"]["address"]}</td><td>#{array[1]["#{j}".to_i]["memory"] / 1048576}</td><td>#{array[1]["#{j}".to_i]["cpu"]["topology"]["cores"]}</td></tr>"
      #puts array[1]["#{j}".to_i]["fqdn"]
      #puts array[1]["#{j}".to_i]["display"]["address"]
      #puts array[1]["#{j}".to_i]["memory"] / 1048576
      #puts array[1]["#{j}".to_i]["cpu"]["topology"]["cores"]
      #puts
    end
    j += 1
  end
end
puts '</tbody></table>'
