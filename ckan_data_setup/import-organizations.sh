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

http http://localhost/tc/data/api/3/action/organization_create name=hksarg-archsd   title="建������                 image_url=$PROVIDER_IMAGE_URL/archsd.png   Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-bd       title="屋������                 image_url=$PROVIDER_IMAGE_URL/bd.png       Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-censtatd title="������統�������             image_url=$PROVIDER_IMAGE_URL/censtatd.png Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-epd      title="������保護���             image_url=$PROVIDER_IMAGE_URL/epd.png      Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-fehd     title="食物������衞������         image_url=$PROVIDER_IMAGE_URL/fehd.png     Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-had      title="民政事���總署"           image_url=$PROVIDER_IMAGE_URL/had.png      Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-hko      title="香港天�������             image_url=$PROVIDER_IMAGE_URL/hko.png      Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-hkpf     title="香港警�������             image_url=$PROVIDER_IMAGE_URL/hkpf.png     Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-landsd   title="���政總署"               image_url=$PROVIDER_IMAGE_URL/landsd.png   Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-md       title="海�������                 image_url=$PROVIDER_IMAGE_URL/md.png       Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-ogcio    title="������資���科���總監辦公��� image_url=$PROVIDER_IMAGE_URL/ogcio.png    Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-rvd      title="差������業估價���         image_url=$PROVIDER_IMAGE_URL/rvd.png      Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-swd      title="社���福利���             image_url=$PROVIDER_IMAGE_URL/swd.png      Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-td       title="���輸���                 image_url=$PROVIDER_IMAGE_URL/td.png       Authorization:$API_KEY_TC
http http://localhost/tc/data/api/3/action/organization_create name=hksarg-various  title="多���������������"           image_url=$PROVIDER_IMAGE_URL/hksar.png    Authorization:$API_KEY_TC

http http://localhost/tc/data/api/3/action/organization_create name=hk-org-rehabsociety title="香港復康���� image_url=$PROVIDER_IMAGE_URL/rehabsociety.png Authorization:$API_KEY_TC

http http://localhost/sc/data/api/3/action/organization_create name=hksarg-archsd   title="建������                 image_url=$PROVIDER_IMAGE_URL/archsd.png   Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-bd       title="屋������                 image_url=$PROVIDER_IMAGE_URL/bd.png       Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-censtatd title="������统计���             image_url=$PROVIDER_IMAGE_URL/censtatd.png Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-epd      title="������保护���             image_url=$PROVIDER_IMAGE_URL/epd.png      Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-fehd     title="食物���������������         image_url=$PROVIDER_IMAGE_URL/fehd.png     Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-had      title="民政事务���署"           image_url=$PROVIDER_IMAGE_URL/had.png      Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-hko      title="香港天�������             image_url=$PROVIDER_IMAGE_URL/hko.png      Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-hkpf     title="香港警务���             image_url=$PROVIDER_IMAGE_URL/hkpf.png     Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-landsd   title="���政���署"               image_url=$PROVIDER_IMAGE_URL/md.png       Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-md       title="海������                 image_url=$PROVIDER_IMAGE_URL/md.png       Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-ogcio    title="������资讯科������������公��� image_url=$PROVIDER_IMAGE_URL/ogcio.png    Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-rvd      title="差饷������估价���         image_url=$PROVIDER_IMAGE_URL/rvd.png      Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-swd      title="社���福利���             image_url=$PROVIDER_IMAGE_URL/swd.png      Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-td       title="运������                 image_url=$PROVIDER_IMAGE_URL/td.png       Authorization:$API_KEY_SC
http http://localhost/sc/data/api/3/action/organization_create name=hksarg-various  title="多个���������门"           image_url=$PROVIDER_IMAGE_URL/hksar.png    Authorization:$API_KEY_SC

http http://localhost/sc/data/api/3/action/organization_create name=hk-org-rehabsociety title="香港复康��� image_url=$PROVIDER_IMAGE_URL/rehabsociety.png Authorization:$API_KEY_SC
