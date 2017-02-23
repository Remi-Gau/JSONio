function tests = test_jsonwrite
% Unit Tests for jsonwrite

% $Id: test_spm_jsonwrite.m 6984 2017-01-09 13:29:55Z guillaume $

tests = functiontests(localfunctions);


function test_jsonwrite_array(testCase)
exp = {'one';'two';'three'};
act = spm_jsonread(spm_jsonwrite(exp));
testCase.verifyTrue(isequal(exp, act));

function test_jsonwrite_object(testCase)
exp = struct('Width',800,'Height',600,'Title','View from the 15th Floor','Animated',false,'IDs',[116;943;234;38793]);
act = spm_jsonread(spm_jsonwrite(exp));
testCase.verifyTrue(isequal(exp, act));

function test_jsonwrite_all_types(testCase)
exp = [];
act = spm_jsonread(spm_jsonwrite(exp));
testCase.verifyTrue(isequal(exp, act));

exp = [true;false];
act = spm_jsonread(spm_jsonwrite(exp));
testCase.verifyTrue(isequal(exp, act));

exp = struct('a','');
act = spm_jsonread(spm_jsonwrite(exp));
testCase.verifyTrue(isequal(exp, act));

str = struct('str',reshape(1:9,3,3));
exp = spm_jsonread('{"str":[[1,4,7],[2,5,8],[3,6,9]]}');
act = spm_jsonread(spm_jsonwrite(str));
testCase.verifyTrue(isequal(act, exp));
