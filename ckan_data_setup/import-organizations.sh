#!/bin/sh

. ./config

http http://localhost/en/data/api/3/action/organization_create name=hksarg-archsd   title="Architectural Services Department"                  image_url=$PROVIDER_IMAGE_URL/archsd.png   Authorization:$API_KEY_EN
http http://localhost/en/data/api/3/action/organization_create name=hksarg-bd       title="Buildings Department"                               image_url=$PROVIDER_IMAGE_URL/bd.png       Authorization:$API_KEY_EN
http http://localhost/en/data/api/3/action/organization_create name=hksarg-censtatd title="Census and Statistics Department"                   image_url=$PROVIDER_IMAGE_URL/censtatd.png Authorization:$API_KEY_EN
http http://localhost/en/data/api/3/action/organization_create name=hksarg-epd      title="Environmental Protection Department"                image_url=$PROVIDER_IMAGE_URL/epd.png      Authorization:$API_KEY_EN
http http://localhost/en/data/api/3/action/organization_create name=hksarg-fehd     title="Food and Environmental Hygiene Department"          image_url=$PROVIDER_IMAGE_URL/fehd.png     Authorization:$API_KEY_EN
http http://localhost/en/data/api/3/action/organization_create name=hksarg-had      title="Home Affairs Department"                            image_url=$PROVIDER_IMAGE_URL/had.png      Authorization:$API_KEY_EN
http http://localhost/en/data/api/3/action/organization_create name=hksarg-hko      title="Hong Kong Observatory"                              image_url=$PROVIDER_IMAGE_URL/hko.png      Authorization:$API_KEY_EN
http http://localhost/en/data/api/3/action/organization_create name=hksarg-hkpf     title="Hong Kong Police Force"                             image_url=$PROVIDER_IMAGE_URL/hkpf.png     Authorization:$API_KEY_EN
http http://localhost/en/data/api/3/action/organization_create name=hksarg-landsd   title="Lands Department"                                   image_url=$PROVIDER_IMAGE_URL/landsd.png   Authorization:$API_KEY_EN
http http://localhost/en/data/api/3/action/organization_create name=hksarg-md       title="Marine Department"                                  image_url=$PROVIDER_IMAGE_URL/md.png       Authorization:$API_KEY_EN
http http://localhost/en/data/api/3/action/organization_create name=hksarg-ogcio    title="Office of the Government Chief Information Officer" image_url=$PROVIDER_IMAGE_URL/ogcio.png    Authorization:$API_KEY_EN
http http://localhost/en/data/api/3/action/organization_create name=hksarg-rvd      title="Rating and Valuation Department"                    image_url=$PROVIDER_IMAGE_URL/rvd.png      Authorization:$API_KEY_EN
http http://localhost/en/data/api/3/action/organization_create name=hksarg-swd      title="Social Welfare Department"                          image_url=$PROVIDER_IMAGE_URL/swd.png      Authorization:$API_KEY_EN
http http://localhost/en/data/api/3/action/organization_create name=hksarg-td       title="Transport Department"                               image_url=$PROVIDER_IMAGE_URL/td.png       Authorization:$API_KEY_EN
http http://localhost/en/data/api/3/action/organization_create name=hksarg-various  title="Various Bureaux / Departments"                      image_url=$PROVIDER_IMAGE_URL/hksar.png    Authorization:$API_KEY_EN

http http://localhost/en/data/api/3/action/organization_create name=hk-org-rehabsociety title="The Hong Kong Society for Rehabilitation" image_url=$PROVIDER_IMAGE_URL/rehabsociety.png Authorization:$API_KEY_EN

http http://localhost/tc/data/api/3/action/organization_create name=hksarg-archsd   title="å»ºçşıç½şı                 image_url=$PROVIDER_IMAGE_URL/archsd.png   Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-bd       title="å±‹åşıç½şı                 image_url=$PROVIDER_IMAGE_URL/bd.png       Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-censtatd title="şı¿åşıçµ±èşışışı             image_url=$PROVIDER_IMAGE_URL/censtatd.png Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-epd      title="şı°åşıä¿è­·ç½şı             image_url=$PROVIDER_IMAGE_URL/epd.png      Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-fehd     title="é£Ÿç‰©şı°åşıè¡çşıç½şı         image_url=$PROVIDER_IMAGE_URL/fehd.png     Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-had      title="æ°‘æ”¿äº‹åşıç¸½ç½²"           image_url=$PROVIDER_IMAGE_URL/had.png      Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-hko      title="é¦™æ¸¯å¤©æşışışı             image_url=$PROVIDER_IMAGE_URL/hko.png      Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-hkpf     title="é¦™æ¸¯è­¦åşışışı             image_url=$PROVIDER_IMAGE_URL/hkpf.png     Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-landsd   title="şı°æ”¿ç¸½ç½²"               image_url=$PROVIDER_IMAGE_URL/landsd.png   Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-md       title="æµ·äşışışı                 image_url=$PROVIDER_IMAGE_URL/md.png       Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-ogcio    title="şı¿åşıè³‡èşıç§‘æşıç¸½ç›£è¾¦å…¬å®şı image_url=$PROVIDER_IMAGE_URL/ogcio.png    Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-rvd      title="å·®éşışı©æ¥­ä¼°åƒ¹ç½şı         image_url=$PROVIDER_IMAGE_URL/rvd.png      Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-swd      title="ç¤¾æşıç¦åˆ©ç½şı             image_url=$PROVIDER_IMAGE_URL/swd.png      Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-td       title="şı‹è¼¸ç½şı                 image_url=$PROVIDER_IMAGE_URL/td.png       Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-various  title="å¤šåşışı¿åşışı¨éşı"           image_url=$PROVIDER_IMAGE_URL/hksar.png    Authorization:$API_KEY_TC

http http://localhost/tc/data/api/3/action/organization_create name=hk-org-rehabsociety title="é¦™æ¸¯å¾©åº·şışı image_url=$PROVIDER_IMAGE_URL/rehabsociety.png Authorization:$API_KEY_TC

http http://localhost/sc/data/api/3/action/organization_create name=hksarg-archsd   title="å»ºçşıç½şı                 image_url=$PROVIDER_IMAGE_URL/archsd.png   Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-bd       title="å±‹åşıç½şı                 image_url=$PROVIDER_IMAGE_URL/bd.png       Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-censtatd title="şı¿åşıç»Ÿè®¡å¤şı             image_url=$PROVIDER_IMAGE_URL/censtatd.png Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-epd      title="şı¯åşıä¿æŠ¤ç½şı             image_url=$PROVIDER_IMAGE_URL/epd.png      Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-fehd     title="é£Ÿç‰©şı¯åşışı«çşıç½şı         image_url=$PROVIDER_IMAGE_URL/fehd.png     Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-had      title="æ°‘æ”¿äº‹åŠ¡şı»ç½²"           image_url=$PROVIDER_IMAGE_URL/had.png      Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-hko      title="é¦™æ¸¯å¤©æşışışı             image_url=$PROVIDER_IMAGE_URL/hko.png      Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-hkpf     title="é¦™æ¸¯è­¦åŠ¡å¤şı             image_url=$PROVIDER_IMAGE_URL/hkpf.png     Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-landsd   title="şı°æ”¿şı»ç½²"               image_url=$PROVIDER_IMAGE_URL/md.png       Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-md       title="æµ·äşıå¤şı                 image_url=$PROVIDER_IMAGE_URL/md.png       Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-ogcio    title="şı¿åşıèµ„è®¯ç§‘æşışı»çşışıå…¬å®şı image_url=$PROVIDER_IMAGE_URL/ogcio.png    Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-rvd      title="å·®é¥·şı©äşıä¼°ä»·ç½şı         image_url=$PROVIDER_IMAGE_URL/rvd.png      Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-swd      title="ç¤¾äşıç¦åˆ©ç½şı             image_url=$PROVIDER_IMAGE_URL/swd.png      Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-td       title="è¿èşıç½şı                 image_url=$PROVIDER_IMAGE_URL/td.png       Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-various  title="å¤šä¸ªşı¿åşışı¨é—¨"           image_url=$PROVIDER_IMAGE_URL/hksar.png    Authorization:$API_KEY_SC

http http://localhost/sc/data/api/3/action/organization_create name=hk-org-rehabsociety title="é¦™æ¸¯å¤åº·ä¼şı image_url=$PROVIDER_IMAGE_URL/rehabsociety.png Authorization:$API_KEY_SC
