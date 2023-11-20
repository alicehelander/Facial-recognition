function grayworld_img = gray_world(C1)

% Split the color channels
r = C1(:,:,1); % Red
g = C1(:,:,2); % Green
b = C1(:,:,3); % Blue

r_avg = mean2(r); 
g_avg = mean2(g); 
b_avg = mean2(b); 

% Calculate the factors to balance the channels
alfa = g_avg/r_avg;
beta = g_avg/b_avg;

% Adjust the channels with factors
r_sensor = alfa.*r;
g_sensor = g;
b_sensor = beta.*b;

% Result
grayworld_img = cat(3, r_sensor, g_sensor, b_sensor);
