
Requirement

- Applied TF in ../test-gcp-interconnect-1 (just for visibility)
- Use interconnect-vpc from project solutions-team
  subnet interconnect-vpc-subnet


testing connectivity for private ADN from the shell of mw-gcp-site1:

```
mw-gcp-site1-7lm2 mw-gcp-site1 /var/home/vesop curl 84.54.63.5
<html><head><title>Error Page</title></head>
<body>The requested URL was rejected. Please consult with your administrator.<br/><br/>
Your support ID is f59ae336-9862-4303-914f-c339c1608df6<h2>Error 404 - Not Found</h2>F5 site: ny8-nyc<br/><br/><a href='javascript:history.back();'>[Go Back]</a></body></html>
mw-gcp-site1-7lm2 mw-gcp-site1 /var/home/vesop traceroute  84.54.63.5
bash: traceroute: command not found
mw-gcp-site1-7lm2 mw-gcp-site1 /var/home/vesop tra
tracepath   tracepath6  trap
mw-gcp-site1-7lm2 mw-gcp-site1 /var/home/vesop tra
tracepath   tracepath6  trap
mw-gcp-site1-7lm2 mw-gcp-site1 /var/home/vesop tracepath 84.54.63.5
 1?: [LOCALHOST]                      pmtu 1500
 1:  no reply
 2:  84.54.63.242                                          9.886ms asymm  3
 3:  no reply
 4:  no reply
 5:  10.200.64.68                                         82.949ms asymm  6
 6:  no reply
 7:  no reply
^C
```
