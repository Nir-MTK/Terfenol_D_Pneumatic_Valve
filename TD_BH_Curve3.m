%% Matlab initialization
format compact
close all
clc
%% Raw Data
H = [
    0.464409349
1.161022577
1.857635806
2.554249034
3.250863854
3.947477082
4.87629578
5.805114479
6.966138648
8.127161225
9.055979924
9.984797031
10.91361573
11.84243284
12.77125154
13.70007023
14.62888893
15.32550216
16.02211698
16.48652633
17.18313956
17.87975279
18.80857148
19.50518471
20.43400182
21.5950244
22.5238431
23.45266179
24.61368437
25.77470695
26.70352565
27.63234435
28.56116145
29.48998015
30.41879885
31.11541208
32.04423078
32.97304948
33.90186817
34.59848299
35.52730169
36.4561188
37.15273203
37.84934526
38.77816236
39.47477559
40.17139041
41.10020911
42.02902781
42.72564263
43.65446133
44.35107455
45.04768937
45.7443026
46.67311971
47.36973294
48.29855164
48.99516486
49.69177809
50.38839291
51.31721161
52.24603031
53.17484901
54.10366771
54.80028093
55.49689416
55.96130192
56.65791515
57.35452838
58.28334708
59.21216577
60.14098447
61.06980317
61.76641799
62.46303122
63.15964445
63.85625768
64.5528709
65.48168801
66.41050671
67.10712153
68.03594023
68.73255346
69.42916828
70.1257815
70.82239473
71.51900955
72.21562437
72.9122376
73.60885083
74.30546406
75.00207728
75.69869051
76.39530374
76.85971309
77.55632791
78.25294114
79.18175984
80.11057853
81.03939723
81.96821593
82.89703463
83.59364786
84.29026109
84.98687432
85.45128207
85.91569142
86.61230465
87.076714
87.77332882
88.70214752
89.39876075
90.09537557
90.79199039
91.48860361
91.95301296
92.64962619
93.34623942
94.04285265
94.73946588
95.4360791
96.13269392
96.82930715
97.52592038
98.2225352
98.91915002
99.61576325
100.0801726
100.7767874
101.2411968
101.93781
102.6344232
103.3310365
103.7954442
104.4920574
104.9564668
105.1886723
105.6530816
106.3496964
106.8141058
107.510719
108.2073322
108.9039471
109.3683564
110.0649696
110.7615829
111.4581961
112.1548093
112.8514225
113.3158319
113.7802412
114.2446506
114.7090599
115.1734693
115.8700825
116.3344919
117.0311067
117.495516
117.9599254
118.4243347
119.1209496
119.5853589
120.0497683
120.7463815
121.2107908
121.6751986
122.1396063
122.6040141
123.0684235
123.5328328
123.9972421
124.4616515
125.1582663
125.6226757
126.087085
126.5514944
127.0159037
127.2481076
127.7125169
128.1769263
128.6413356
129.105745
129.8023582
130.266766
130.7311737
131.1955831
131.6599924
132.1244018
132.5888111
133.0532205
133.5176298
133.9820392
134.2142447
134.678654
135.1430633
135.3752672
135.8396766
136.3040859
136.7684953
137.2329046
137.697314
138.1617233
138.3939272
138.6261327
138.8583381
139.3227475
139.5549514
140.0193607
140.2515646
140.7159724
140.9481762
141.4125856
141.8769949
142.3414043
142.8058136
143.270223
143.5024269
143.7346307
143.9668346
144.1990401
144.4312456
144.8956549
145.3600643
145.8244736
146.0566775
146.2888814
146.2888814
146.2888814
146.5210868
146.7532923
147.2177017
147.4499071
147.9143165
148.1465204
148.3787242
148.3787242
148.6109281
148.843132
149.0753359
149.3075397
149.5397436
150.004153
150.2363584
150.4685639
150.7007694
150.9329749
150.9329749
150.9329749
151.1651787
151.1651787
151.3973826
151.6295865
151.8617904
151.8617904
152.0939943
152.3261997
152.5584052
152.5584052
152.7906107
153.0228161
153.0228161
153.25502
153.4872255
153.4872255
153.7194294
153.7194294
153.4872255
153.7194294
153.9516332
153.9516332
154.1838371
154.416041
154.416041
154.6482465
154.6482465
154.6482465
154.6482465
154.6482465
154.6482465
154.8804519
155.1126574
155.3448629
155.5770684
155.3448629
155.3448629
155.3448629
155.3448629
155.3448629
155.5770684
155.3448629
155.3448629
155.3448629
155.3448629
155.3448629
155.3448629
155.3448629
155.1126574
154.8804519
154.6482465
154.6482465
154.416041
154.416041
154.416041
154.416041
154.416041
154.1838371
153.9516332
153.7194294
153.4872255
153.2550216
153.2550216
153.2550216
153.2550216
153.2550216
153.2550216
153.0228161
152.7906107
152.5584052
152.3261997
152.3261997
152.3261997
152.3261997
152.0939958
151.861792
151.3973826
151.1651787
150.9329749
150.7007694
150.4685639
150.2363584
150.004153
149.7719475
149.7719475
149.5397436
149.3075397
149.0753359
148.843132
148.6109281
148.3787242
148.1465204
147.9143165
147.6821126
147.4499087
147.2177032
146.9854978
146.7532923
146.288883
145.8244736
145.5922697
145.1278604
144.663451
144.4312456
143.9668362
143.7346307
143.5024269
143.270223
143.0380191
143.0380191
142.5736098
142.3414043
142.1091988
141.8769933
141.412584
140.9481762
140.4837685
140.0193607
139.554953
139.0905436
138.8583381
138.6261327
138.1617233
137.9295179
137.4651085
137.0006992
136.5362898
136.3040843
135.6074711
135.1430618
134.6786524
134.2142431
133.5176298
133.0532205
132.8210166
132.5888127
132.1244034
131.659994
131.4277886
130.9633792
130.266766
129.8023582
129.5701543
128.8735411
128.4091318
127.9447224
127.4803131
126.7836982
126.3192889
125.6226757
125.1582663
124.693857
124.2294476
123.7650383
123.3006289
122.8362196
122.1396063
121.4429931
120.7463799
120.2819705
119.5853573
119.120948
118.8887441
118.4243347
117.7277215
117.2633122
116.5666973
116.102288
115.4056748
114.7090599
114.2446506
113.7802412
113.0836264
112.6192171
112.1548093
111.6904
110.9937867
110.2971735
109.6005603
109.1361509
108.2073322
107.7429229
107.0463097
106.3496948
105.65308
105.1886707
104.4920574
103.7954442
103.3310365
102.6344232
101.93781
101.2411968
100.7767874
100.0801726
99.38355937
98.68694614
97.99033132
97.2937165
96.59710327
96.13269392
95.4360791
94.73946588
94.04285265
93.5784433
92.88183007
92.18521684
91.48860361
90.79199039
89.86317169
89.16655687
88.46994364
87.77332882
87.076714
86.38010077
85.68348754
84.98687432
84.29026109
83.36144398
82.66483075
81.73601205
81.03939723
80.34278401
79.64616919
78.94955437
78.25294114
77.55632791
76.85971309
76.16309986
75.23428275
74.53766953
73.60885083
72.68003372
71.98342049
71.51901114
70.82239632
70.1257831
69.42916828
68.73255346
67.80373476
66.87491606
66.17830124
65.24948413
64.32066703
63.39184833
62.6952351
61.76641799
61.06980317
60.37318835
59.67657512
58.74775643
58.05114161
57.35452838
56.42571127
55.49689257
54.80027934
53.87146224
52.94264354
52.24602872
51.54941549
50.62059679
49.92398197
49.22736874
48.53075552
47.60193682
46.90532359
46.20871036
45.27989166
44.35107296
43.42225426
42.49343557
41.33241299
40.63579976
39.70698106
39.01036783
38.08155073
37.61714138
36.68832268
35.75950557
35.06289234
34.36627752
33.20525495
32.50864172
31.8120269
30.8832082
30.18659497
29.48998015
28.56116145
27.63234435
26.70352565
25.77470695
24.84588984
23.91707114
22.98825244
22.29163922
21.36282052
20.43400182
19.73738859
19.04077536
18.11195666
17.41534344
16.71873021
15.78991151
15.09329669
14.39668346
13.46786476
12.77124994
12.07463672
11.37802349
10.68141026
9.984797031
9.288183803
8.591570575
7.894957346
7.198342527
6.733933177
5.805114479
5.108499659
4.179680961
3.250862262
2.089839684
1.161022577
0.23220547
-0.696613228
-1.393226456
-2.089839684
-2.786454504
-3.715273203
-4.644091901
-5.5729106
-6.733934769
-7.894957346
-8.823776045
-9.752593152
-10.91361573
-11.61022896
-12.30684219
-13.23566088
-13.9322757
-14.62888893
-15.32550216
-16.02211698
-16.71873021
-17.64754732
-18.57636601
-19.73738859
-20.6662057
-21.82722828
-22.98825244
-24.14927502
-25.3102976
-26.47132018
-27.40013888
-28.32895598
-29.02556921
-29.72218403
-30.41879885
-31.34761755
-32.27643625
-33.20525495
-33.90186817
-34.83068687
-35.5273001
-36.22391333
-37.15273203
-38.08155073
-39.01036783
-39.93918653
-40.63580135
-41.33241458
-42.26123328
-42.9578481
-43.8866668
-44.8154855
-45.74430419
-46.44091742
-47.36973453
-48.06634776
-48.76296099
-49.45957421
-50.38839291
-51.31721161
-52.01382484
-52.94264354
-53.87146224
-54.56807546
-55.26468869
-56.19350739
-56.89012062
-57.58673385
-58.51555255
-59.21216737
-59.90878059
-60.83759929
-61.53421411
-62.23082734
-62.92744057
-63.6240538
-64.32066703
-65.24948413
-65.94609736
-66.87491606
-67.80373476
-68.50034799
-68.96475733
-69.89357603
-70.59018926
-71.28680408
-71.9834189
-72.9122376
-73.37664695
-74.07326018
-74.76987341
-75.46648663
-76.16309986
-77.09191856
-77.78853338
-78.48514661
-79.41396531
-80.11058013
-80.80719335
-81.50380658
-82.2004214
-82.89703463
-83.59364786
-84.29026109
-84.98687432
-85.68348754
-86.14789689
-86.84451012
-87.30891947
-88.00553429
-88.70214752
-89.39876075
-90.09537557
-90.79199039
-91.48860361
-92.18521684
-92.88183007
-93.34623783
-94.04285106
-94.73946428
-95.20387363
-95.90048845
-96.59710327
-97.2937165
-97.75812585
-98.45474067
-99.1513539
-99.84796713
-100.5445819
-101.2411968
-101.93781
-102.4022193
-102.8666287
-103.3310365
-103.7954442
-104.2598536
-104.7242629
-105.4208761
-105.8852855
-106.5819003
-107.0463097
-107.7429229
-108.4395377
-109.1361525
-109.6005619
-110.2971751
-110.7615844
-110.9937883
-111.4581961
-111.9226038
-112.3870132
-113.0836264
-113.7802396
-114.244649
-114.9412638
-115.4056732
-115.8700825
-116.5666973
-117.0311067
-117.495516
-117.9599254
-118.4243347
-118.6565386
-119.120948
-119.5853573
-120.2819705
-120.514176
-120.9785854
-121.4429947
-121.9074025
-122.1396063
-122.8362196
-123.3006289
-123.9972421
-124.4616515
-124.9260608
-125.3904702
-125.8548795
-126.087085
-126.5514944
-127.0159037
-127.2481076
-127.7125169
-128.1769263
-128.4091318
-128.6413372
-129.1057466
-129.3379505
-129.5701543
-130.0345621
-130.4989699
-130.7311737
-131.1955831
-131.6599924
-131.8921979
-132.3566073
-132.8210166
-133.0532205
-133.2854244
-133.7498337
-133.7498337
-133.9820392
-134.4464485
-134.9108579
-135.1430618
-135.6074711
-135.839675
-136.0718805
-136.3040859
-136.5362914
-137.0007007
-137.4651101
-137.697314
-137.9295179
-138.3939272
-138.6261327
-138.8583381
-139.0905436
-139.3227491
-139.554953
-139.7871568
-139.7871568
-140.0193607
-140.2515646
-140.2515646
-140.4837685
-140.9481762
-141.1803801
-141.412584
-141.6447879
-141.6447879
-141.6447879
-141.8769933
-142.1091988
-142.3414043
-142.5736098
-142.8058152
-142.8058152
-142.8058152
-143.0380191
-143.270223
-143.5024269
-143.7346307
-143.9668346
-143.9668346
-143.9668346
-143.9668346
-143.9668346
-143.9668346
-143.9668346
-143.9668346
-143.9668346
-143.9668346
-144.1990401
-144.4312456
-144.663451
-144.8956565
-145.127862
-145.127862
-145.127862
-145.127862
-145.127862
-145.127862
-145.127862
-145.127862
-145.127862
-144.8956565
-144.8956565
-145.1278604
-145.1278604
-145.1278604
-145.3600659
-145.3600659
-145.127862
-145.127862
-145.127862
-145.127862
-144.8956565
-144.8956565
-144.8956565
-144.8956565
-144.663451
-144.8956565
-144.8956565
-144.663451
-144.4312456
-144.4312456
-144.1990401
-143.9668346
-143.9668346
-143.9668346
-143.9668346
-143.9668346
-143.9668346
-143.7346307
-143.5024269
-143.270223
-143.0380191
-142.8058152
-142.8058152
-142.8058152
-142.8058152
-142.8058152
-142.5736098
-142.5736098
-142.5736098
-142.1092004
-141.8769949
-141.8769949
-141.6447895
-141.412584
-141.412584
-141.412584
-141.1803801
-140.9481762
-140.7159724
-140.7159724
-140.2515646
-140.0193607
-139.7871568
-139.3227475
-139.0905436
-139.0905436
-138.8583381
-138.6261327
-138.6261327
-138.3939272
-137.9295179
-137.697314
-137.4651101
-137.2329062
-136.7684969
-136.5362914
-136.3040859
-136.0718805
-135.6074711
-135.3752672
-135.1430633
-134.9108595
-134.4464501
-134.2142447
-133.9820392
-133.7498337
-133.5176282
-133.2854244
-133.0532205
-132.5888111
-132.1244018
-131.6599924
-131.427787
-130.9633776
-130.7311737
-130.266766
-129.8023582
-129.3379505
-129.1057466
-128.8735427
-128.6413372
-128.4091318
-128.1769263
-127.7125169
-127.2481076
-126.7836982
-126.3192889
-125.8548795
-125.3904702
-124.9260608
-124.4616515
-123.9972421
-123.5328328
-123.0684235
-122.6040141
-122.3718102
-121.9074025
-121.4429947
-121.2107908
-120.7463815
-120.2819721
-119.8175628
-119.120948
-118.6565386
-118.1921293
-117.7277199
-117.2633106
-117.0311067
-116.3344919
-115.8700825
-115.4056732
-114.9412638
-114.4768545
-114.2446506
-113.7802412
-113.083628
-112.6192187
-112.1548093
-111.4581961
-110.9937883
-110.7615844
-110.2971751
-109.6005619
-109.1361525
-108.6717432
-107.9751284
-107.2785151
-106.8141058
-106.3496964
-105.6530816
-105.1886723
-104.7242629
-104.2598536
-103.5632403
-103.0988326
-102.4022193
-101.93781
-101.2411968
-100.7767874
-100.0801726
-99.38355937
-98.68694614
-98.22253679
-97.52592197
-97.06151262
-96.59710327
-96.13269392
-95.4360791
-94.97166975
-94.27505653
-93.81064718
-93.11403395
-92.64962619
-91.72080908
-91.25639973
-90.55978651
-89.86317169
-89.16655687
-88.70214752
-88.00553429
-87.30891947
-86.61230624
-85.91569301
-85.45128366
-84.75467044
-84.05805721
-83.36144398
-82.66483075
-81.96821752
-81.2716027
-80.57498948
-80.11058013
-79.41396531
-78.71735049
-78.02073726
-77.55632791
-76.85971309
-76.39530374
-75.69869051
-75.23428116
-74.30546246
-73.60884924
-72.68003213
-71.9834189
-71.0546002
-70.59019085
-69.89357763
-69.42916828
-68.73255346
-68.03594023
-67.339327
-66.64271218
-65.71389348
-65.01728025
-64.32066703
-63.6240538
-62.92744057
-62.23082734
-61.53421411
-60.83759929
-59.90878059
-58.9799619
-58.28334708
-57.58673226
-56.89011903
-56.1935058
-55.72909804
-55.03248481
-54.10366771
-53.17484901
-52.47823419
-51.54941549
-50.85280226
-50.15618744
-49.45957421
-48.76296099
-48.06634776
-47.13752906
-46.20871195
-45.51209872
-44.58328003
-43.65446133
-42.9578481
-42.26123328
-41.33241458
-40.63580135
-39.93918653
-39.24257171
-38.54595848
-37.84934526
-37.15273203
-36.4561188
-35.75950557
-35.06289234
-34.36627752
-33.43745883
-32.7408456
-31.8120269
-30.8832082
-29.9543895
-29.25777468
-28.32895598
-27.40013888
-26.70352565
-26.23911789
-25.31030078
-24.61368755
-23.91707274
-22.98825404
-22.05943534
-21.36282052
-20.6662057
-19.96959247
-19.27297924
-18.34416054
-17.64754732
-16.95093409
-16.25432086
-15.55770604
-15.09329669
-14.39668346
-13.70007023
-13.00345541
-12.53904606
-12.07463672
-11.61022737
-10.91361414
-10.44920638
-9.984798622
-9.288185394
-8.823776045
-8.359366696
-7.894957346
-7.430547997
-7.198344118
-6.733934769
-6.501729299
-6.269523828
-6.037318358
-5.572909008
-5.34070513
-4.87629578
-4.411886431
-3.947477082
-3.715271611
-3.250862262
-3.250862262
-3.018658383
-2.786454504
-2.554250625
-2.322045155
-2.089841276
-1.857635806
-1.857635806
-1.393226456
-1.161022577


];

B = [
    -0.141947651
-0.115956136
-0.088952277
-0.058911395
-0.025833504
0.009269079
0.044261841
0.078242281
0.109075889
0.136872466
0.16174181
0.18458649
0.206418791
0.227238758
0.248058702
0.26887869
0.291723347
0.314677837
0.339656995
0.364745985
0.390737479
0.416728972
0.443622991
0.470626819
0.496508525
0.521268064
0.54208803
0.55987097
0.574507075
0.586106153
0.595790349
0.604462233
0.61212176
0.618768952
0.625416122
0.630148433
0.635783246
0.641418082
0.646040583
0.650772871
0.655395349
0.659005516
0.66272547
0.666445424
0.670055568
0.673775522
0.677495476
0.681105642
0.684715764
0.68742336
0.691033504
0.694753458
0.697461055
0.701181031
0.70479122
0.708511174
0.711108961
0.714828893
0.716524133
0.71923173
0.720817205
0.724427371
0.727025202
0.729623033
0.732330653
0.736050584
0.738867992
0.741575589
0.744283208
0.745868661
0.747454135
0.74903961
0.751637441
0.75434506
0.757052679
0.759760276
0.762467874
0.764163136
0.765748589
0.768346377
0.771054017
0.772639492
0.774334754
0.777042373
0.77974997
0.781445211
0.78415283
0.786860448
0.788555711
0.789238661
0.790933945
0.791616851
0.793312114
0.795007376
0.797824805
0.799520089
0.802227686
0.803813117
0.805398569
0.806984022
0.808569474
0.810154971
0.811850278
0.81354554
0.815240803
0.817045875
0.818850947
0.82054621
0.822351304
0.824046566
0.825632018
0.827327281
0.829022543
0.830717805
0.83241309
0.834218184
0.834901089
0.836596352
0.838291614
0.839986877
0.84168214
0.843377446
0.845072708
0.846767971
0.847450876
0.849146138
0.850841378
0.851634116
0.852317043
0.854122137
0.854805065
0.856500327
0.85819559
0.860000663
0.86068359
0.862488684
0.864403566
0.865196325
0.865879275
0.867684324
0.869379565
0.870062493
0.871757733
0.873562783
0.875258067
0.874928638
0.875611566
0.876294516
0.877989801
0.878782538
0.880587632
0.881380369
0.883185441
0.883978179
0.884661106
0.885453844
0.887149106
0.888954156
0.889746871
0.891551921
0.893247183
0.89403992
0.893820323
0.895515585
0.896308323
0.898113395
0.899918468
0.90172354
0.902516278
0.903309015
0.903089395
0.902869776
0.903552725
0.904345485
0.906150579
0.906943316
0.90874841
0.909650935
0.910443651
0.910224031
0.912029103
0.912821818
0.913504724
0.91429744
0.915090156
0.915882893
0.91667563
0.917468368
0.918261105
0.919053842
0.919846579
0.920639317
0.921541864
0.922334601
0.923127338
0.924029885
0.924822623
0.92561536
0.926408097
0.928213169
0.92799355
0.928786265
0.92968879
0.930591315
0.931493862
0.933298912
0.934201437
0.934994152
0.935896677
0.936689393
0.936579606
0.936360008
0.937152768
0.93693317
0.936713551
0.937506266
0.939421148
0.939311317
0.941226199
0.942128745
0.943031292
0.942811673
0.94360441
0.943384791
0.943274981
0.943165172
0.944177528
0.945189885
0.946092432
0.946994979
0.947787716
0.947677906
0.947458287
0.947348477
0.948251002
0.949263337
0.950165862
0.95106841
0.951970957
0.951861169
0.951751382
0.951531785
0.951421975
0.951312165
0.951202355
0.952104879
0.953117214
0.954129549
0.955032074
0.956044409
0.955934599
0.95582479
0.95571498
0.95571498
0.955605171
0.955495361
0.955385551
0.955385551
0.955275741
0.955165931
0.956178288
0.957080835
0.957983382
0.958995738
0.958885951
0.958885951
0.95899576
0.958885951
0.958776142
0.959788476
0.959678667
0.959568857
0.959568857
0.959459047
0.959459047
0.959459047
0.959459047
0.959459047
0.959459047
0.959349237
0.959239427
0.959129617
0.959019807
0.960141952
0.960141952
0.960141952
0.960141952
0.960141952
0.959019807
0.959129617
0.959129617
0.960141974
0.960141974
0.960141974
0.961154309
0.961154309
0.960251762
0.960361572
0.960471382
0.959459047
0.959568857
0.959568857
0.959568857
0.959568857
0.959568857
0.959678667
0.959788476
0.959898286
0.958995738
0.958093191
0.958093191
0.957080834
0.956068478
0.957080834
0.957080834
0.956178288
0.956288098
0.956397908
0.955495361
0.955495361
0.955495361
0.955495361
0.95560517
0.95571498
0.955934599
0.955032074
0.954129549
0.953227024
0.952324499
0.951421975
0.951531785
0.951641595
0.951641595
0.951751382
0.951861169
0.950958622
0.95106841
0.950165862
0.949263337
0.948360812
0.948470621
0.947568096
0.946665549
0.946775359
0.945872812
0.945982622
0.945189885
0.945409504
0.944506957
0.944726576
0.943933839
0.944043649
0.943250934
0.942348387
0.941445862
0.940543336
0.938628454
0.937616098
0.936823382
0.935920836
0.935018289
0.935128099
0.935347696
0.934554959
0.934774577
0.93398184
0.933189102
0.932396387
0.932506196
0.93160365
0.930810934
0.930920744
0.930128029
0.929335314
0.928542599
0.928652409
0.926957146
0.926164409
0.924359315
0.923566578
0.922883628
0.92209089
0.921188343
0.921298153
0.920505415
0.9197127
0.918810153
0.918017416
0.917334466
0.916541706
0.914626824
0.913943918
0.913151203
0.911346175
0.909541147
0.908858242
0.908065527
0.907382599
0.90658984
0.90579708
0.905004321
0.903199227
0.901394133
0.900601396
0.899918468
0.898223183
0.897540233
0.896747496
0.896064568
0.894259496
0.893356971
0.892564256
0.891881328
0.890076278
0.889393373
0.888600657
0.887917752
0.887234846
0.886442109
0.88564935
0.883954066
0.882148972
0.880343899
0.879551162
0.877855899
0.877172971
0.875477687
0.873672593
0.872087118
0.870282068
0.868586828
0.867903922
0.86620866
0.865415945
0.864733017
0.863037733
0.86123266
0.860549732
0.858854448
0.857159163
0.856366426
0.855683499
0.853988236
0.852292974
0.851610046
0.849914784
0.848219522
0.84641445
0.844719188
0.843023925
0.841328663
0.839523591
0.83985302
0.838157757
0.836462494
0.83476721
0.833181713
0.830474072
0.82877881
0.827083548
0.825388286
0.823693045
0.821997805
0.82030252
0.818607236
0.818034117
0.81735119
0.815765715
0.814070431
0.812375146
0.810679862
0.807972266
0.806277025
0.804581785
0.801874188
0.799166591
0.797581116
0.794873496
0.793288022
0.791702547
0.790007262
0.787189855
0.785494593
0.782786996
0.781091756
0.778384159
0.777811041
0.77521321
0.773517926
0.771932451
0.770346976
0.767749145
0.766053904
0.763456116
0.76074852
0.75905328
0.756345682
0.754760186
0.753064902
0.751369617
0.748771785
0.746173998
0.743466423
0.740868635
0.737258491
0.734550894
0.73285561
0.730257778
0.727550138
0.725854853
0.723147212
0.719537068
0.716829471
0.714121873
0.710511729
0.707913942
0.706328468
0.702718302
0.70023028
0.697522682
0.693912538
0.690192584
0.687594797
0.684777412
0.681167246
0.678569436
0.674849504
0.671129551
0.66661686
0.662896906
0.659176952
0.654554451
0.650834498
0.647114544
0.6435044
0.638881921
0.635271755
0.630649254
0.626026753
0.620391917
0.61475706
0.610024749
0.604389914
0.597742744
0.591998098
0.58524114
0.577581636
0.569812299
0.562042984
0.553371122
0.544589451
0.533783111
0.522074245
0.509243191
0.494387489
0.477507074
0.458601968
0.43767217
0.413705367
0.387713852
0.359697667
0.330669126
0.299506105
0.269575039
0.239534185
0.210615475
0.182709122
0.156937241
0.131055551
0.105173858
0.077267476
0.047226604
0.01414871
-0.021966218
-0.05797135
-0.092964127
-0.125932224
-0.155753483
-0.181525372
-0.205382364
-0.227214666
-0.248937157
-0.27087929
-0.2928214
-0.31566608
-0.34064526
-0.366636754
-0.392628225
-0.42064441
-0.449672929
-0.477579305
-0.504473367
-0.531257598
-0.554102256
-0.573800078
-0.590460873
-0.604084621
-0.613659029
-0.623233438
-0.631905278
-0.639564783
-0.646321785
-0.653078765
-0.65882341
-0.66344591
-0.668068411
-0.67269089
-0.677423178
-0.682045679
-0.686777968
-0.690497922
-0.694108066
-0.697718232
-0.701328376
-0.703926186
-0.708658474
-0.712378428
-0.71598855
-0.719708503
-0.723318669
-0.725916478
-0.728514288
-0.731221929
-0.733819739
-0.737539671
-0.740247268
-0.742954865
-0.746565009
-0.749162796
-0.751870438
-0.754468269
-0.758078435
-0.759773698
-0.762481295
-0.764066725
-0.766774323
-0.768469607
-0.771067416
-0.773775057
-0.776482699
-0.779080508
-0.781788105
-0.784495702
-0.786190942
-0.788898539
-0.790593802
-0.793191612
-0.794886896
-0.796472371
-0.798057846
-0.800765487
-0.802570581
-0.805168368
-0.807875965
-0.809571205
-0.811266445
-0.813864233
-0.815669327
-0.817364611
-0.82007223
-0.821767493
-0.823462756
-0.82504823
-0.826743514
-0.828438777
-0.830024229
-0.830707135
-0.832402397
-0.83409766
-0.835792944
-0.837488228
-0.84019587
-0.841891132
-0.843586395
-0.845281679
-0.847086773
-0.848782014
-0.850587064
-0.852282304
-0.853977544
-0.85466045
-0.855343399
-0.857038683
-0.85873399
-0.859416918
-0.862124537
-0.862917253
-0.864612537
-0.8663078
-0.868112894
-0.869808156
-0.87150344
-0.872186324
-0.872979017
-0.873661922
-0.87434485
-0.876040113
-0.877735419
-0.879430725
-0.881126009
-0.882931081
-0.884736153
-0.885528869
-0.887333942
-0.889139036
-0.889931795
-0.891627058
-0.892419795
-0.8931027
-0.893895393
-0.895590612
-0.896273539
-0.898981158
-0.900786252
-0.902481514
-0.903274252
-0.904176777
-0.904969515
-0.905762253
-0.906555012
-0.90723794
-0.908933246
-0.909725984
-0.910408911
-0.911201648
-0.913006742
-0.91368967
-0.91347005
-0.914262788
-0.916067838
-0.916860553
-0.917763056
-0.919568106
-0.921373156
-0.922056106
-0.922958653
-0.922739055
-0.924544127
-0.925336865
-0.92623939
-0.926922318
-0.92872739
-0.928397983
-0.92919072
-0.929983458
-0.930776195
-0.931568932
-0.932471479
-0.933264194
-0.93405691
-0.934959435
-0.936764507
-0.937557222
-0.937447412
-0.938349959
-0.939142718
-0.939032931
-0.940947813
-0.941740551
-0.942533288
-0.943435814
-0.944228529
-0.944008932
-0.944911478
-0.944691859
-0.945484574
-0.946387099
-0.947289625
-0.948082362
-0.948082362
-0.948984909
-0.948765311
-0.948545714
-0.949448239
-0.950240976
-0.950131167
-0.951033692
-0.952948573
-0.95385112
-0.954643857
-0.955436594
-0.956339142
-0.956229332
-0.956009713
-0.956912237
-0.955790093
-0.955680283
-0.956582808
-0.957485355
-0.958387902
-0.960412571
-0.961315119
-0.961205331
-0.961205331
-0.9610955
-0.960875881
-0.961778406
-0.962680931
-0.9625711
-0.963583457
-0.964595813
-0.963473669
-0.963363859
-0.964266405
-0.964156596
-0.964046786
-0.96505912
-0.966071477
-0.966974024
-0.966864237
-0.967766784
-0.968669331
-0.968559522
-0.968559522
-0.969571857
-0.968559522
-0.967547187
-0.967547187
-0.967547187
-0.967547187
-0.968559522
-0.969571857
-0.969462047
-0.969352237
-0.969242427
-0.969132617
-0.969022807
-0.969022807
-0.969022807
-0.969022807
-0.969022807
-0.969022807
-0.969022807
-0.969022807
-0.969022807
-0.969132617
-0.969132617
-0.969022807
-0.970035164
-0.970035164
-0.969925354
-0.969925354
-0.970035163
-0.969022807
-0.969022807
-0.969022807
-0.968120282
-0.968120282
-0.968120282
-0.968120282
-0.967217757
-0.968120282
-0.968120282
-0.968230092
-0.968339902
-0.969352237
-0.969462047
-0.969571857
-0.969571857
-0.968559522
-0.968559522
-0.967547187
-0.966534853
-0.965632305
-0.965742093
-0.964839545
-0.964949333
-0.964046786
-0.964046786
-0.964046786
-0.963034451
-0.963034451
-0.964156596
-0.964156596
-0.962131926
-0.962351546
-0.962461356
-0.961448999
-0.960546452
-0.961668575
-0.961668575
-0.960656218
-0.960766049
-0.960875881
-0.960985712
-0.960985712
-0.961205331
-0.961315119
-0.961424906
-0.960632169
-0.959729622
-0.958717287
-0.957814762
-0.956912237
-0.956912237
-0.957022047
-0.95622931
-0.95633912
-0.956448929
-0.955546382
-0.954753645
-0.954863454
-0.953960908
-0.953058361
-0.95327798
-0.95338779
-0.953497599
-0.952595074
-0.951802337
-0.95089979
-0.949997243
-0.948082362
-0.947179815
-0.94627729
-0.946387099
-0.945594384
-0.945814004
-0.946033623
-0.945131076
-0.943326026
-0.942423501
-0.941630763
-0.940838025
-0.941057644
-0.940155075
-0.939252506
-0.938349959
-0.937447412
-0.936544865
-0.936764507
-0.936984148
-0.936191433
-0.935398718
-0.934606003
-0.933813265
-0.933020528
-0.932227791
-0.931435053
-0.930642316
-0.929849557
-0.929056797
-0.928154272
-0.927361534
-0.92555644
-0.923641558
-0.921836486
-0.921043726
-0.920250989
-0.920580419
-0.920800038
-0.920007323
-0.919214608
-0.918421892
-0.916507032
-0.914811792
-0.914019077
-0.913226362
-0.912433625
-0.911640887
-0.91073834
-0.909945603
-0.909262653
-0.908469915
-0.907677156
-0.906994228
-0.90620149
-0.904286609
-0.902481514
-0.901798587
-0.901005827
-0.899200733
-0.898517806
-0.897834878
-0.897042141
-0.895237113
-0.894554208
-0.893761492
-0.892968799
-0.891163749
-0.890480799
-0.889688062
-0.887992777
-0.886187683
-0.88449242
-0.882687348
-0.880992064
-0.880309136
-0.878613874
-0.878833471
-0.878150544
-0.876345494
-0.874540444
-0.873747729
-0.872052489
-0.870247417
-0.869564489
-0.867759417
-0.867076489
-0.865271395
-0.863685942
-0.861880848
-0.86119792
-0.859502636
-0.858819708
-0.858026949
-0.856331709
-0.854636447
-0.852941184
-0.851245921
-0.849440872
-0.848757922
-0.847062637
-0.845367375
-0.843672112
-0.841976849
-0.840281587
-0.838586303
-0.836781209
-0.835085925
-0.833390641
-0.8316954
-0.830902707
-0.829207445
-0.827402373
-0.82570711
-0.823902016
-0.82231652
-0.820621257
-0.818023447
-0.81734052
-0.815755045
-0.813949973
-0.813267045
-0.81247433
-0.809766711
-0.808071449
-0.806376186
-0.803668567
-0.801070758
-0.799375496
-0.797680233
-0.794972614
-0.793277351
-0.791582089
-0.789886826
-0.787179229
-0.785593799
-0.78299599
-0.781300706
-0.779605422
-0.777910137
-0.775202496
-0.77238511
-0.769677513
-0.767079725
-0.764481938
-0.762786698
-0.761201202
-0.759505917
-0.756798298
-0.755103014
-0.752395372
-0.75070011
-0.748102323
-0.745504535
-0.742796938
-0.740199128
-0.737601319
-0.7348937
-0.732186059
-0.729588228
-0.726880608
-0.723160677
-0.72045308
-0.717745483
-0.714025529
-0.711317932
-0.708610291
-0.704890315
-0.702182695
-0.699475099
-0.695864955
-0.692145023
-0.688534879
-0.684924735
-0.680302256
-0.677594637
-0.673984471
-0.671386684
-0.666654395
-0.663836966
-0.658202152
-0.65448222
-0.64974991
-0.645127409
-0.639492551
-0.635772576
-0.630027931
-0.625295642
-0.620563354
-0.615940875
-0.610196252
-0.604451606
-0.597694604
-0.590937625
-0.584070857
-0.57630152
-0.568532206
-0.560762913
-0.55187141
-0.541967595
-0.531051422
-0.520245059
-0.507304173
-0.494363353
-0.480519942
-0.466566765
-0.451601254
-0.435623386
-0.420657853
-0.40355784
-0.387579972
-0.371492273
-0.356416952
-0.340329275
-0.327388433
-0.314337781
-0.301396918
-0.290480745
-0.279564573
-0.269550948
-0.259647132
-0.25154841
-0.242547141
-0.235570542
-0.228593964
-0.222629722
-0.216665479
-0.211713572
-0.206651854
-0.201809734
-0.159401134
];
j=1;
for i=1:length(H)
    if H(i)>=0
    pos_H(j) = H(i);
    pos_B(j) = B(i);
    j=j+1;
    end
end

 pol = polyfit(pos_H,pos_B,6);
 B_pol = polyval(pol,pos_H);

figure()
plot(H,B)
hold 'on'
plot(pos_H,pos_B)
hold 'on'
plot(pos_H,B_pol)
grid 'on'
xlabel('H [Kiloamper/M]')
ylabel('B [Tesla]')
title('B-H Raw Data and Polynomial Data Comperration')
grid 'on'
legend('Raw Data', 'Polynomial Data', 'Location','southeast' )
int_x = linspace(min(pos_H),max(pos_H));

figure()
zero = zeros(length(pos_H));
plot(pos_H,pos_B-B_pol)
hold 'on';
plot(pos_H,zero,'black');
title('B-H Raw Data and Polynomial Data Differance')
xlabel('H [Kiloamper/M]')
ylabel('\Delta B [Tesla]')
grid 'on'