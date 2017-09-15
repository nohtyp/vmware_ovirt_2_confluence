require 'fog/vsphere'

compute = Fog::Compute.new(
  provider: :vsphere,
  vsphere_username: '<user to access vmware>',
  vsphere_password: '<password for user above>',
  vsphere_server: '<vcenter server name>',
  vsphere_expected_pubkey_hash: '<This hash will be sent back the first time you connect to vcenter. Leave this blank until you have the hash ',
  vsphere_ssl: true,
  vsphere_rev: '6.0'
)

puts '<table><tbody><tr><th>Hostname</th><th>IPAddress</th><th>Memory</th><th>CPU</th></tr>'
compute.list_virtual_machines.each { |x| print "<tr><td>#{x["name"]}</td><td>#{x["ipaddress"]}</td><td>#{x["memory_mb"]}</td><td>#{x["cpus"]}</td></tr>" if "#{x["power_state"]}" == 'poweredOn' }
puts '</tbody></table>'
