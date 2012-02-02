$TTL 604800         - Bind 9 (and some of the later versions of Bind 8) requires $TTL statement. Measured in seconds. This value is 7 days.
fmmapps.com.    IN      SOA  ns1.fmmapps.com.  hostmaster.fmmapps.com. (
   2000021600 ; serial     - Many people use year+month+day+integer as a system.
   86400 ; refresh         - How often secondary servers (in seconds) should check in for changes in serial number. (86400 sec = 24 hrs)
   7200 ; retry            - How long secondary server should wait for a retry if contact failed.
   1209600 ; expire        - Secondary server to purge info after this length of time.
   86400 ) ; default_ttl   - How long data is held in cache by remote servers.
       IN A       50.116.95.92  - Note that this is the default IP address of the domain. 
                                     I put the web server IP address here so that domain.com points to the same servers as www.domain.com
;
; Name servers for the domain
;
       IN NS         ns1.fmmapps.com.
       IN NS         ns2.fmmapps.com.
;
; Mail server for domain
;
       IN MX    5    mail               - Identify "mail" as the node handling mail for the domain. Do NOT specify an IP address!
;
; Nodes in domain
;
node1  IN A          50.116.95.92    - Note that this is the IP address of node1
ns1    IN A          50.116.95.92    - Optional: For hosting your own primary name server. Note that this is the IP address of ns1
ns2    IN A          50.116.95.93    - Optional: For hosting your own secondary name server. Note that this is the IP address of ns2
mail   IN A          50.116.95.92    - Identify the IP address for node mail.
       IN MX    5    50.116.95.92    - Identify the IP address for mail server named "mail".
;
; Aliases to existing nodes in domain
;
www    IN CNAME      node1              - Define the webserver "www" to be node1.
ftp    IN CNAME      node1              - Define the ftp server to be node1.