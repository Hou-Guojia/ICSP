%% Non-uniform Illumination Underwater Image Restoration via Illumination Channel Sparsity Prior
%% Guojia Hou, Nan Li, Peixian Zhuang, Kunqian Li, Haihan Sun, and Chongyi Li
%% Accepted by IEEE Transactions on Circuits and Systems for Video Technology, 2023

tic;
close all;clear all;clc;
addpath utils
%% Path
script_path = fileparts(mfilename('fullpath'));
img_path = fullfile(script_path, 'images/');
save_dir = fullfile(script_path, 'results/');
%% Load the image
fprintf('Starting\n');
%ÅúÁ¿¶ÁÈ¡Í¼Ïñ
ext = {'*.jpeg','*.jpg','*.png','*.pgm', '*.tif','*.bmp'};
img_path_list = [];
img_path_list_ = [];
for i = 1: length(ext)
    img_path_list_ = dir([img_path, ext{i}]);
    img_path_list = [img_path_list;img_path_list_];
end
img_num = length(img_path_list);
fprintf('img_num: %d\n', img_num);
if img_num > 0
    for i = 1: img_num
        img_name = img_path_list(i).name;
        fprintf('%d %s\n',i,strcat(img_path, img_name));
        % Read Image
        img = double(imread([img_path, img_name]))./256;
        cell_str = strsplit(img_name, '.');
        name = cell_str{1, 1};
        type = cell_str{1, 2};
        % My
        [ul,t_ul] = ICSP(img, img_name);
        imwrite(uint8(ul*256.0), [save_dir, name, '_restored.', type]);
    end
end
toc;
fprintf('Finished\n');