[slaves]
%{ for ip in ips ~}
${ip}
%{ endfor ~}
