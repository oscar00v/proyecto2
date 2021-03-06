function z=rgbs(type)
%RGBS Return RGB specifications
%   RGBS holds specifications for a number of RGB spaces.
%   RGBS(NAME) return struct with data.
%   RGBS without input returns the names of valid specs.
%
%   Example:
%      Get the illuminant/Observer used in sRGB
%
%         srgb=rgbs('srgb');
%         disp(srgb.IllObs);
%
%   See also XYZ2RGB, RGB2XYZ, RGB2DISP

%   All data, except for "perc", is taken from Bruce Lindbloom "Some Common
%   RGB Working Space Matrices", http://www.brucelindbloom.com

% Part of the OptProp toolbox, $Version: 2.1 $
% Author:  Jerker W?gberg, More Research & DPC, Sweden
% Email: ['jerker.wagberg' char(64) 'more.se']

% $Id: rgbs.m 23 2007-01-28 22:55:34Z jerkerw $

	persistent Data
	if isempty(Data)
		Data=struct( ...
			  'Name',	{'adobe' 'apple' 'best'	 'beta'  'bruce' 'cie' 'colormatch'	'don4'  'eci'   'ektaspace' 'ntsc' 'pal'   'prophoto' 'smpte-c' 'srgb'      'wide'} ...
			, 'IllObs', {'D65/2' 'D65/2' 'D50/2' 'D50/2' 'D65/2' 'E/2' 'D50/2'      'D50/2' 'D50/2' 'D50/2'     'C/2'  'D65/2' 'D50/2'    'D65/2'   'D65/2'     'D50/2'} ...
			, 'Gamma',  { 2.2     1.8     2.2     2.2     2.2     2.2   1.8          2.2     1.8     2.2         2.2    2.2     1.8        2.2       @srgbgamma  2.2} ...
			, 'xyy',	{
						  [0.64 0.33 29.7361;0.21 0.71 62.7355;0.15 0.06 7.52847] ...
						, [0.625 0.34 24.4634;0.28 0.595 67.2034;0.155 0.07 8.33318] ...
						, [0.7347 0.2653 22.8457;0.215 0.775 73.7352;0.13 0.0349999 3.41908] ...
						, [0.6888 0.3112 30.3273;0.1986 0.7551 66.3786;0.1265 0.0352 3.29413] ...
						, [0.64 0.33 24.0995;0.28 0.65 68.3554;0.15 0.06 7.54517] ...
						, [0.735 0.265 17.6204;0.274 0.717 81.2985;0.167 0.00900002 1.08109] ...
						, [0.63 0.34 27.4884;0.295 0.605 65.8132;0.15 0.0749999 6.69845] ...
						, [0.696 0.3 27.835;0.215 0.765 68.797;0.13 0.035 3.36802] ...
						, [0.67 0.33 32.025;0.21 0.71 60.2071;0.14 0.0800001 7.76791] ...
						, [0.695 0.305 26.0629;0.26 0.7 73.4946;0.11 0.005 0.442493] ...
						, [0.67 0.33 29.8839;0.21 0.71 58.6811;0.14 0.0800002 11.435] ...
						, [0.64 0.33 22.2021;0.29 0.6 70.6645;0.15 0.06 7.13342] ...
						, [0.7347 0.2653 28.804;0.1596 0.8404 71.1874;0.0366 0.000100391 0.0086] ...
						, [0.63 0.34 21.2395;0.31 0.595 70.1049;0.155 0.07 8.65558] ...
						, [0.64 0.33 21.2656;0.3 0.6 71.5158;0.15 0.06 7.21856] ...
						, [0.735 0.265 25.8187;0.115 0.826 72.4938;0.157 0.018 1.68748] ...
						} ...
				);
		end
	if nargin==0
		z={Data.Name};
	else
		if isempty(type)
			type = optgetpref('WorkingRGB');
			end
		if isstruct(type)
			z=type;
		else
			type=partialmatch(type,{Data.Name},'noerr');
			if isstruct(type); error(type);end
			z=Data(strcmp(type,{Data.Name}));
			end
		end
	