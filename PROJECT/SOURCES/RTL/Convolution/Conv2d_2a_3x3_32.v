// Convolution Kernel 3x3, Stride = 1, Padding = 0. 
//Input = 149x149x32, Output = 147x147x1024.

module Conv2d_2a_3x3_32
#(
  parameter D = 220,
  parameter DATA_WIDTH = 32)
(
    	input clk,
     	input reset,
     	input valid_in_1,valid_in_2,valid_in_3,valid_in_4,valid_in_5,valid_in_6,valid_in_7,valid_in_8,valid_in_9,
            valid_in_10,valid_in_11,valid_in_12,valid_in_13,valid_in_14,valid_in_15,valid_in_16,valid_in_17,valid_in_18,
            valid_in_19,valid_in_20,valid_in_21,valid_in_22,valid_in_23,valid_in_24,valid_in_25,valid_in_26,valid_in_27,
            valid_in_28,valid_in_29,valid_in_30,valid_in_31,valid_in_32,
            
      input [DATA_WIDTH-1:0] pxl_in_1,pxl_in_2,pxl_in_3,pxl_in_4,pxl_in_5,pxl_in_6,pxl_in_7,pxl_in_8,pxl_in_9,
                             pxl_in_10,pxl_in_11,pxl_in_12,pxl_in_13,pxl_in_14,pxl_in_15,pxl_in_16,pxl_in_17,pxl_in_18,
                             pxl_in_19,pxl_in_20,pxl_in_21,pxl_in_22,pxl_in_23,pxl_in_24,pxl_in_25,pxl_in_26,pxl_in_27,
                             pxl_in_28,pxl_in_29,pxl_in_30,pxl_in_31,pxl_in_32,
                             
     output [DATA_WIDTH-1:0] pxl_out_1,pxl_out_2,pxl_out_3,pxl_out_4,pxl_out_5,pxl_out_6,pxl_out_7,pxl_out_8,pxl_out_9,
pxl_out_10,pxl_out_11,pxl_out_12,pxl_out_13,pxl_out_14,pxl_out_15,pxl_out_16,pxl_out_17,pxl_out_18,
pxl_out_19,pxl_out_20,pxl_out_21,pxl_out_22,pxl_out_23,pxl_out_24,pxl_out_25,pxl_out_26,pxl_out_27,
pxl_out_28,pxl_out_29,pxl_out_30,pxl_out_31,pxl_out_32,pxl_out_33,pxl_out_34,pxl_out_35,pxl_out_36,
pxl_out_37,pxl_out_38,pxl_out_39,pxl_out_40,pxl_out_41,pxl_out_42,pxl_out_43,pxl_out_44,pxl_out_45,
pxl_out_46,pxl_out_47,pxl_out_48,pxl_out_49,pxl_out_50,pxl_out_51,pxl_out_52,pxl_out_53,pxl_out_54,
pxl_out_55,pxl_out_56,pxl_out_57,pxl_out_58,pxl_out_59,pxl_out_60,pxl_out_61,pxl_out_62,pxl_out_63,
pxl_out_64,pxl_out_65,pxl_out_66,pxl_out_67,pxl_out_68,pxl_out_69,pxl_out_70,pxl_out_71,pxl_out_72,
pxl_out_73,pxl_out_74,pxl_out_75,pxl_out_76,pxl_out_77,pxl_out_78,pxl_out_79,pxl_out_80,pxl_out_81,
pxl_out_82,pxl_out_83,pxl_out_84,pxl_out_85,pxl_out_86,pxl_out_87,pxl_out_88,pxl_out_89,pxl_out_90,
pxl_out_91,pxl_out_92,pxl_out_93,pxl_out_94,pxl_out_95,pxl_out_96,pxl_out_97,pxl_out_98,pxl_out_99,
pxl_out_100,pxl_out_101,pxl_out_102,pxl_out_103,pxl_out_104,pxl_out_105,pxl_out_106,pxl_out_107,pxl_out_108,
pxl_out_109,pxl_out_110,pxl_out_111,pxl_out_112,pxl_out_113,pxl_out_114,pxl_out_115,pxl_out_116,pxl_out_117,
pxl_out_118,pxl_out_119,pxl_out_120,pxl_out_121,pxl_out_122,pxl_out_123,pxl_out_124,pxl_out_125,pxl_out_126,
pxl_out_127,pxl_out_128,pxl_out_129,pxl_out_130,pxl_out_131,pxl_out_132,pxl_out_133,pxl_out_134,pxl_out_135,
pxl_out_136,pxl_out_137,pxl_out_138,pxl_out_139,pxl_out_140,pxl_out_141,pxl_out_142,pxl_out_143,pxl_out_144,
pxl_out_145,pxl_out_146,pxl_out_147,pxl_out_148,pxl_out_149,pxl_out_150,pxl_out_151,pxl_out_152,pxl_out_153,
pxl_out_154,pxl_out_155,pxl_out_156,pxl_out_157,pxl_out_158,pxl_out_159,pxl_out_160,pxl_out_161,pxl_out_162,
pxl_out_163,pxl_out_164,pxl_out_165,pxl_out_166,pxl_out_167,pxl_out_168,pxl_out_169,pxl_out_170,pxl_out_171,
pxl_out_172,pxl_out_173,pxl_out_174,pxl_out_175,pxl_out_176,pxl_out_177,pxl_out_178,pxl_out_179,pxl_out_180,
pxl_out_181,pxl_out_182,pxl_out_183,pxl_out_184,pxl_out_185,pxl_out_186,pxl_out_187,pxl_out_188,pxl_out_189,
pxl_out_190,pxl_out_191,pxl_out_192,pxl_out_193,pxl_out_194,pxl_out_195,pxl_out_196,pxl_out_197,pxl_out_198,
pxl_out_199,pxl_out_200,pxl_out_201,pxl_out_202,pxl_out_203,pxl_out_204,pxl_out_205,pxl_out_206,pxl_out_207,
pxl_out_208,pxl_out_209,pxl_out_210,pxl_out_211,pxl_out_212,pxl_out_213,pxl_out_214,pxl_out_215,pxl_out_216,
pxl_out_217,pxl_out_218,pxl_out_219,pxl_out_220,pxl_out_221,pxl_out_222,pxl_out_223,pxl_out_224,pxl_out_225,
pxl_out_226,pxl_out_227,pxl_out_228,pxl_out_229,pxl_out_230,pxl_out_231,pxl_out_232,pxl_out_233,pxl_out_234,
pxl_out_235,pxl_out_236,pxl_out_237,pxl_out_238,pxl_out_239,pxl_out_240,pxl_out_241,pxl_out_242,pxl_out_243,
pxl_out_244,pxl_out_245,pxl_out_246,pxl_out_247,pxl_out_248,pxl_out_249,pxl_out_250,pxl_out_251,pxl_out_252,
pxl_out_253,pxl_out_254,pxl_out_255,pxl_out_256,pxl_out_257,pxl_out_258,pxl_out_259,pxl_out_260,pxl_out_261,
pxl_out_262,pxl_out_263,pxl_out_264,pxl_out_265,pxl_out_266,pxl_out_267,pxl_out_268,pxl_out_269,pxl_out_270,
pxl_out_271,pxl_out_272,pxl_out_273,pxl_out_274,pxl_out_275,pxl_out_276,pxl_out_277,pxl_out_278,pxl_out_279,
pxl_out_280,pxl_out_281,pxl_out_282,pxl_out_283,pxl_out_284,pxl_out_285,pxl_out_286,pxl_out_287,pxl_out_288,
pxl_out_289,pxl_out_290,pxl_out_291,pxl_out_292,pxl_out_293,pxl_out_294,pxl_out_295,pxl_out_296,pxl_out_297,
pxl_out_298,pxl_out_299,pxl_out_300,pxl_out_301,pxl_out_302,pxl_out_303,pxl_out_304,pxl_out_305,pxl_out_306,
pxl_out_307,pxl_out_308,pxl_out_309,pxl_out_310,pxl_out_311,pxl_out_312,pxl_out_313,pxl_out_314,pxl_out_315,
pxl_out_316,pxl_out_317,pxl_out_318,pxl_out_319,pxl_out_320,pxl_out_321,pxl_out_322,pxl_out_323,pxl_out_324,
pxl_out_325,pxl_out_326,pxl_out_327,pxl_out_328,pxl_out_329,pxl_out_330,pxl_out_331,pxl_out_332,pxl_out_333,
pxl_out_334,pxl_out_335,pxl_out_336,pxl_out_337,pxl_out_338,pxl_out_339,pxl_out_340,pxl_out_341,pxl_out_342,
pxl_out_343,pxl_out_344,pxl_out_345,pxl_out_346,pxl_out_347,pxl_out_348,pxl_out_349,pxl_out_350,pxl_out_351,
pxl_out_352,pxl_out_353,pxl_out_354,pxl_out_355,pxl_out_356,pxl_out_357,pxl_out_358,pxl_out_359,pxl_out_360,
pxl_out_361,pxl_out_362,pxl_out_363,pxl_out_364,pxl_out_365,pxl_out_366,pxl_out_367,pxl_out_368,pxl_out_369,
pxl_out_370,pxl_out_371,pxl_out_372,pxl_out_373,pxl_out_374,pxl_out_375,pxl_out_376,pxl_out_377,pxl_out_378,
pxl_out_379,pxl_out_380,pxl_out_381,pxl_out_382,pxl_out_383,pxl_out_384,pxl_out_385,pxl_out_386,pxl_out_387,
pxl_out_388,pxl_out_389,pxl_out_390,pxl_out_391,pxl_out_392,pxl_out_393,pxl_out_394,pxl_out_395,pxl_out_396,
pxl_out_397,pxl_out_398,pxl_out_399,pxl_out_400,pxl_out_401,pxl_out_402,pxl_out_403,pxl_out_404,pxl_out_405,
pxl_out_406,pxl_out_407,pxl_out_408,pxl_out_409,pxl_out_410,pxl_out_411,pxl_out_412,pxl_out_413,pxl_out_414,
pxl_out_415,pxl_out_416,pxl_out_417,pxl_out_418,pxl_out_419,pxl_out_420,pxl_out_421,pxl_out_422,pxl_out_423,
pxl_out_424,pxl_out_425,pxl_out_426,pxl_out_427,pxl_out_428,pxl_out_429,pxl_out_430,pxl_out_431,pxl_out_432,
pxl_out_433,pxl_out_434,pxl_out_435,pxl_out_436,pxl_out_437,pxl_out_438,pxl_out_439,pxl_out_440,pxl_out_441,
pxl_out_442,pxl_out_443,pxl_out_444,pxl_out_445,pxl_out_446,pxl_out_447,pxl_out_448,pxl_out_449,pxl_out_450,
pxl_out_451,pxl_out_452,pxl_out_453,pxl_out_454,pxl_out_455,pxl_out_456,pxl_out_457,pxl_out_458,pxl_out_459,
pxl_out_460,pxl_out_461,pxl_out_462,pxl_out_463,pxl_out_464,pxl_out_465,pxl_out_466,pxl_out_467,pxl_out_468,
pxl_out_469,pxl_out_470,pxl_out_471,pxl_out_472,pxl_out_473,pxl_out_474,pxl_out_475,pxl_out_476,pxl_out_477,
pxl_out_478,pxl_out_479,pxl_out_480,pxl_out_481,pxl_out_482,pxl_out_483,pxl_out_484,pxl_out_485,pxl_out_486,
pxl_out_487,pxl_out_488,pxl_out_489,pxl_out_490,pxl_out_491,pxl_out_492,pxl_out_493,pxl_out_494,pxl_out_495,
pxl_out_496,pxl_out_497,pxl_out_498,pxl_out_499,pxl_out_500,pxl_out_501,pxl_out_502,pxl_out_503,pxl_out_504,
pxl_out_505,pxl_out_506,pxl_out_507,pxl_out_508,pxl_out_509,pxl_out_510,pxl_out_511,pxl_out_512,pxl_out_513,
pxl_out_514,pxl_out_515,pxl_out_516,pxl_out_517,pxl_out_518,pxl_out_519,pxl_out_520,pxl_out_521,pxl_out_522,
pxl_out_523,pxl_out_524,pxl_out_525,pxl_out_526,pxl_out_527,pxl_out_528,pxl_out_529,pxl_out_530,pxl_out_531,
pxl_out_532,pxl_out_533,pxl_out_534,pxl_out_535,pxl_out_536,pxl_out_537,pxl_out_538,pxl_out_539,pxl_out_540,
pxl_out_541,pxl_out_542,pxl_out_543,pxl_out_544,pxl_out_545,pxl_out_546,pxl_out_547,pxl_out_548,pxl_out_549,
pxl_out_550,pxl_out_551,pxl_out_552,pxl_out_553,pxl_out_554,pxl_out_555,pxl_out_556,pxl_out_557,pxl_out_558,
pxl_out_559,pxl_out_560,pxl_out_561,pxl_out_562,pxl_out_563,pxl_out_564,pxl_out_565,pxl_out_566,pxl_out_567,
pxl_out_568,pxl_out_569,pxl_out_570,pxl_out_571,pxl_out_572,pxl_out_573,pxl_out_574,pxl_out_575,pxl_out_576,
pxl_out_577,pxl_out_578,pxl_out_579,pxl_out_580,pxl_out_581,pxl_out_582,pxl_out_583,pxl_out_584,pxl_out_585,
pxl_out_586,pxl_out_587,pxl_out_588,pxl_out_589,pxl_out_590,pxl_out_591,pxl_out_592,pxl_out_593,pxl_out_594,
pxl_out_595,pxl_out_596,pxl_out_597,pxl_out_598,pxl_out_599,pxl_out_600,pxl_out_601,pxl_out_602,pxl_out_603,
pxl_out_604,pxl_out_605,pxl_out_606,pxl_out_607,pxl_out_608,pxl_out_609,pxl_out_610,pxl_out_611,pxl_out_612,
pxl_out_613,pxl_out_614,pxl_out_615,pxl_out_616,pxl_out_617,pxl_out_618,pxl_out_619,pxl_out_620,pxl_out_621,
pxl_out_622,pxl_out_623,pxl_out_624,pxl_out_625,pxl_out_626,pxl_out_627,pxl_out_628,pxl_out_629,pxl_out_630,
pxl_out_631,pxl_out_632,pxl_out_633,pxl_out_634,pxl_out_635,pxl_out_636,pxl_out_637,pxl_out_638,pxl_out_639,
pxl_out_640,pxl_out_641,pxl_out_642,pxl_out_643,pxl_out_644,pxl_out_645,pxl_out_646,pxl_out_647,pxl_out_648,
pxl_out_649,pxl_out_650,pxl_out_651,pxl_out_652,pxl_out_653,pxl_out_654,pxl_out_655,pxl_out_656,pxl_out_657,
pxl_out_658,pxl_out_659,pxl_out_660,pxl_out_661,pxl_out_662,pxl_out_663,pxl_out_664,pxl_out_665,pxl_out_666,
pxl_out_667,pxl_out_668,pxl_out_669,pxl_out_670,pxl_out_671,pxl_out_672,pxl_out_673,pxl_out_674,pxl_out_675,
pxl_out_676,pxl_out_677,pxl_out_678,pxl_out_679,pxl_out_680,pxl_out_681,pxl_out_682,pxl_out_683,pxl_out_684,
pxl_out_685,pxl_out_686,pxl_out_687,pxl_out_688,pxl_out_689,pxl_out_690,pxl_out_691,pxl_out_692,pxl_out_693,
pxl_out_694,pxl_out_695,pxl_out_696,pxl_out_697,pxl_out_698,pxl_out_699,pxl_out_700,pxl_out_701,pxl_out_702,
pxl_out_703,pxl_out_704,pxl_out_705,pxl_out_706,pxl_out_707,pxl_out_708,pxl_out_709,pxl_out_710,pxl_out_711,
pxl_out_712,pxl_out_713,pxl_out_714,pxl_out_715,pxl_out_716,pxl_out_717,pxl_out_718,pxl_out_719,pxl_out_720,
pxl_out_721,pxl_out_722,pxl_out_723,pxl_out_724,pxl_out_725,pxl_out_726,pxl_out_727,pxl_out_728,pxl_out_729,
pxl_out_730,pxl_out_731,pxl_out_732,pxl_out_733,pxl_out_734,pxl_out_735,pxl_out_736,pxl_out_737,pxl_out_738,
pxl_out_739,pxl_out_740,pxl_out_741,pxl_out_742,pxl_out_743,pxl_out_744,pxl_out_745,pxl_out_746,pxl_out_747,
pxl_out_748,pxl_out_749,pxl_out_750,pxl_out_751,pxl_out_752,pxl_out_753,pxl_out_754,pxl_out_755,pxl_out_756,
pxl_out_757,pxl_out_758,pxl_out_759,pxl_out_760,pxl_out_761,pxl_out_762,pxl_out_763,pxl_out_764,pxl_out_765,
pxl_out_766,pxl_out_767,pxl_out_768,pxl_out_769,pxl_out_770,pxl_out_771,pxl_out_772,pxl_out_773,pxl_out_774,
pxl_out_775,pxl_out_776,pxl_out_777,pxl_out_778,pxl_out_779,pxl_out_780,pxl_out_781,pxl_out_782,pxl_out_783,
pxl_out_784,pxl_out_785,pxl_out_786,pxl_out_787,pxl_out_788,pxl_out_789,pxl_out_790,pxl_out_791,pxl_out_792,
pxl_out_793,pxl_out_794,pxl_out_795,pxl_out_796,pxl_out_797,pxl_out_798,pxl_out_799,pxl_out_800,pxl_out_801,
pxl_out_802,pxl_out_803,pxl_out_804,pxl_out_805,pxl_out_806,pxl_out_807,pxl_out_808,pxl_out_809,pxl_out_810,
pxl_out_811,pxl_out_812,pxl_out_813,pxl_out_814,pxl_out_815,pxl_out_816,pxl_out_817,pxl_out_818,pxl_out_819,
pxl_out_820,pxl_out_821,pxl_out_822,pxl_out_823,pxl_out_824,pxl_out_825,pxl_out_826,pxl_out_827,pxl_out_828,
pxl_out_829,pxl_out_830,pxl_out_831,pxl_out_832,pxl_out_833,pxl_out_834,pxl_out_835,pxl_out_836,pxl_out_837,
pxl_out_838,pxl_out_839,pxl_out_840,pxl_out_841,pxl_out_842,pxl_out_843,pxl_out_844,pxl_out_845,pxl_out_846,
pxl_out_847,pxl_out_848,pxl_out_849,pxl_out_850,pxl_out_851,pxl_out_852,pxl_out_853,pxl_out_854,pxl_out_855,
pxl_out_856,pxl_out_857,pxl_out_858,pxl_out_859,pxl_out_860,pxl_out_861,pxl_out_862,pxl_out_863,pxl_out_864,
pxl_out_865,pxl_out_866,pxl_out_867,pxl_out_868,pxl_out_869,pxl_out_870,pxl_out_871,pxl_out_872,pxl_out_873,
pxl_out_874,pxl_out_875,pxl_out_876,pxl_out_877,pxl_out_878,pxl_out_879,pxl_out_880,pxl_out_881,pxl_out_882,
pxl_out_883,pxl_out_884,pxl_out_885,pxl_out_886,pxl_out_887,pxl_out_888,pxl_out_889,pxl_out_890,pxl_out_891,
pxl_out_892,pxl_out_893,pxl_out_894,pxl_out_895,pxl_out_896,pxl_out_897,pxl_out_898,pxl_out_899,pxl_out_900,
pxl_out_901,pxl_out_902,pxl_out_903,pxl_out_904,pxl_out_905,pxl_out_906,pxl_out_907,pxl_out_908,pxl_out_909,
pxl_out_910,pxl_out_911,pxl_out_912,pxl_out_913,pxl_out_914,pxl_out_915,pxl_out_916,pxl_out_917,pxl_out_918,
pxl_out_919,pxl_out_920,pxl_out_921,pxl_out_922,pxl_out_923,pxl_out_924,pxl_out_925,pxl_out_926,pxl_out_927,
pxl_out_928,pxl_out_929,pxl_out_930,pxl_out_931,pxl_out_932,pxl_out_933,pxl_out_934,pxl_out_935,pxl_out_936,
pxl_out_937,pxl_out_938,pxl_out_939,pxl_out_940,pxl_out_941,pxl_out_942,pxl_out_943,pxl_out_944,pxl_out_945,
pxl_out_946,pxl_out_947,pxl_out_948,pxl_out_949,pxl_out_950,pxl_out_951,pxl_out_952,pxl_out_953,pxl_out_954,
pxl_out_955,pxl_out_956,pxl_out_957,pxl_out_958,pxl_out_959,pxl_out_960,pxl_out_961,pxl_out_962,pxl_out_963,
pxl_out_964,pxl_out_965,pxl_out_966,pxl_out_967,pxl_out_968,pxl_out_969,pxl_out_970,pxl_out_971,pxl_out_972,
pxl_out_973,pxl_out_974,pxl_out_975,pxl_out_976,pxl_out_977,pxl_out_978,pxl_out_979,pxl_out_980,pxl_out_981,
pxl_out_982,pxl_out_983,pxl_out_984,pxl_out_985,pxl_out_986,pxl_out_987,pxl_out_988,pxl_out_989,pxl_out_990,
pxl_out_991,pxl_out_992,pxl_out_993,pxl_out_994,pxl_out_995,pxl_out_996,pxl_out_997,pxl_out_998,pxl_out_999,
pxl_out_1000,pxl_out_1001,pxl_out_1002,pxl_out_1003,pxl_out_1004,pxl_out_1005,pxl_out_1006,pxl_out_1007,pxl_out_1008,
pxl_out_1009,pxl_out_1010,pxl_out_1011,pxl_out_1012,pxl_out_1013,pxl_out_1014,pxl_out_1015,pxl_out_1016,pxl_out_1017,
pxl_out_1018,pxl_out_1019,pxl_out_1020,pxl_out_1021,pxl_out_1022,pxl_out_1023,pxl_out_1024,  
  
  output valid_out_1,valid_out_2,valid_out_3,valid_out_4,valid_out_5,valid_out_6,valid_out_7,valid_out_8,valid_out_9,
valid_out_10,valid_out_11,valid_out_12,valid_out_13,valid_out_14,valid_out_15,valid_out_16,valid_out_17,valid_out_18,
valid_out_19,valid_out_20,valid_out_21,valid_out_22,valid_out_23,valid_out_24,valid_out_25,valid_out_26,valid_out_27,
valid_out_28,valid_out_29,valid_out_30,valid_out_31,valid_out_32,valid_out_33,valid_out_34,valid_out_35,valid_out_36,
valid_out_37,valid_out_38,valid_out_39,valid_out_40,valid_out_41,valid_out_42,valid_out_43,valid_out_44,valid_out_45,
valid_out_46,valid_out_47,valid_out_48,valid_out_49,valid_out_50,valid_out_51,valid_out_52,valid_out_53,valid_out_54,
valid_out_55,valid_out_56,valid_out_57,valid_out_58,valid_out_59,valid_out_60,valid_out_61,valid_out_62,valid_out_63,
valid_out_64,valid_out_65,valid_out_66,valid_out_67,valid_out_68,valid_out_69,valid_out_70,valid_out_71,valid_out_72,
valid_out_73,valid_out_74,valid_out_75,valid_out_76,valid_out_77,valid_out_78,valid_out_79,valid_out_80,valid_out_81,
valid_out_82,valid_out_83,valid_out_84,valid_out_85,valid_out_86,valid_out_87,valid_out_88,valid_out_89,valid_out_90,
valid_out_91,valid_out_92,valid_out_93,valid_out_94,valid_out_95,valid_out_96,valid_out_97,valid_out_98,valid_out_99,
valid_out_100,valid_out_101,valid_out_102,valid_out_103,valid_out_104,valid_out_105,valid_out_106,valid_out_107,valid_out_108,
valid_out_109,valid_out_110,valid_out_111,valid_out_112,valid_out_113,valid_out_114,valid_out_115,valid_out_116,valid_out_117,
valid_out_118,valid_out_119,valid_out_120,valid_out_121,valid_out_122,valid_out_123,valid_out_124,valid_out_125,valid_out_126,
valid_out_127,valid_out_128,valid_out_129,valid_out_130,valid_out_131,valid_out_132,valid_out_133,valid_out_134,valid_out_135,
valid_out_136,valid_out_137,valid_out_138,valid_out_139,valid_out_140,valid_out_141,valid_out_142,valid_out_143,valid_out_144,
valid_out_145,valid_out_146,valid_out_147,valid_out_148,valid_out_149,valid_out_150,valid_out_151,valid_out_152,valid_out_153,
valid_out_154,valid_out_155,valid_out_156,valid_out_157,valid_out_158,valid_out_159,valid_out_160,valid_out_161,valid_out_162,
valid_out_163,valid_out_164,valid_out_165,valid_out_166,valid_out_167,valid_out_168,valid_out_169,valid_out_170,valid_out_171,
valid_out_172,valid_out_173,valid_out_174,valid_out_175,valid_out_176,valid_out_177,valid_out_178,valid_out_179,valid_out_180,
valid_out_181,valid_out_182,valid_out_183,valid_out_184,valid_out_185,valid_out_186,valid_out_187,valid_out_188,valid_out_189,
valid_out_190,valid_out_191,valid_out_192,valid_out_193,valid_out_194,valid_out_195,valid_out_196,valid_out_197,valid_out_198,
valid_out_199,valid_out_200,valid_out_201,valid_out_202,valid_out_203,valid_out_204,valid_out_205,valid_out_206,valid_out_207,
valid_out_208,valid_out_209,valid_out_210,valid_out_211,valid_out_212,valid_out_213,valid_out_214,valid_out_215,valid_out_216,
valid_out_217,valid_out_218,valid_out_219,valid_out_220,valid_out_221,valid_out_222,valid_out_223,valid_out_224,valid_out_225,
valid_out_226,valid_out_227,valid_out_228,valid_out_229,valid_out_230,valid_out_231,valid_out_232,valid_out_233,valid_out_234,
valid_out_235,valid_out_236,valid_out_237,valid_out_238,valid_out_239,valid_out_240,valid_out_241,valid_out_242,valid_out_243,
valid_out_244,valid_out_245,valid_out_246,valid_out_247,valid_out_248,valid_out_249,valid_out_250,valid_out_251,valid_out_252,
valid_out_253,valid_out_254,valid_out_255,valid_out_256,valid_out_257,valid_out_258,valid_out_259,valid_out_260,valid_out_261,
valid_out_262,valid_out_263,valid_out_264,valid_out_265,valid_out_266,valid_out_267,valid_out_268,valid_out_269,valid_out_270,
valid_out_271,valid_out_272,valid_out_273,valid_out_274,valid_out_275,valid_out_276,valid_out_277,valid_out_278,valid_out_279,
valid_out_280,valid_out_281,valid_out_282,valid_out_283,valid_out_284,valid_out_285,valid_out_286,valid_out_287,valid_out_288,
valid_out_289,valid_out_290,valid_out_291,valid_out_292,valid_out_293,valid_out_294,valid_out_295,valid_out_296,valid_out_297,
valid_out_298,valid_out_299,valid_out_300,valid_out_301,valid_out_302,valid_out_303,valid_out_304,valid_out_305,valid_out_306,
valid_out_307,valid_out_308,valid_out_309,valid_out_310,valid_out_311,valid_out_312,valid_out_313,valid_out_314,valid_out_315,
valid_out_316,valid_out_317,valid_out_318,valid_out_319,valid_out_320,valid_out_321,valid_out_322,valid_out_323,valid_out_324,
valid_out_325,valid_out_326,valid_out_327,valid_out_328,valid_out_329,valid_out_330,valid_out_331,valid_out_332,valid_out_333,
valid_out_334,valid_out_335,valid_out_336,valid_out_337,valid_out_338,valid_out_339,valid_out_340,valid_out_341,valid_out_342,
valid_out_343,valid_out_344,valid_out_345,valid_out_346,valid_out_347,valid_out_348,valid_out_349,valid_out_350,valid_out_351,
valid_out_352,valid_out_353,valid_out_354,valid_out_355,valid_out_356,valid_out_357,valid_out_358,valid_out_359,valid_out_360,
valid_out_361,valid_out_362,valid_out_363,valid_out_364,valid_out_365,valid_out_366,valid_out_367,valid_out_368,valid_out_369,
valid_out_370,valid_out_371,valid_out_372,valid_out_373,valid_out_374,valid_out_375,valid_out_376,valid_out_377,valid_out_378,
valid_out_379,valid_out_380,valid_out_381,valid_out_382,valid_out_383,valid_out_384,valid_out_385,valid_out_386,valid_out_387,
valid_out_388,valid_out_389,valid_out_390,valid_out_391,valid_out_392,valid_out_393,valid_out_394,valid_out_395,valid_out_396,
valid_out_397,valid_out_398,valid_out_399,valid_out_400,valid_out_401,valid_out_402,valid_out_403,valid_out_404,valid_out_405,
valid_out_406,valid_out_407,valid_out_408,valid_out_409,valid_out_410,valid_out_411,valid_out_412,valid_out_413,valid_out_414,
valid_out_415,valid_out_416,valid_out_417,valid_out_418,valid_out_419,valid_out_420,valid_out_421,valid_out_422,valid_out_423,
valid_out_424,valid_out_425,valid_out_426,valid_out_427,valid_out_428,valid_out_429,valid_out_430,valid_out_431,valid_out_432,
valid_out_433,valid_out_434,valid_out_435,valid_out_436,valid_out_437,valid_out_438,valid_out_439,valid_out_440,valid_out_441,
valid_out_442,valid_out_443,valid_out_444,valid_out_445,valid_out_446,valid_out_447,valid_out_448,valid_out_449,valid_out_450,
valid_out_451,valid_out_452,valid_out_453,valid_out_454,valid_out_455,valid_out_456,valid_out_457,valid_out_458,valid_out_459,
valid_out_460,valid_out_461,valid_out_462,valid_out_463,valid_out_464,valid_out_465,valid_out_466,valid_out_467,valid_out_468,
valid_out_469,valid_out_470,valid_out_471,valid_out_472,valid_out_473,valid_out_474,valid_out_475,valid_out_476,valid_out_477,
valid_out_478,valid_out_479,valid_out_480,valid_out_481,valid_out_482,valid_out_483,valid_out_484,valid_out_485,valid_out_486,
valid_out_487,valid_out_488,valid_out_489,valid_out_490,valid_out_491,valid_out_492,valid_out_493,valid_out_494,valid_out_495,
valid_out_496,valid_out_497,valid_out_498,valid_out_499,valid_out_500,valid_out_501,valid_out_502,valid_out_503,valid_out_504,
valid_out_505,valid_out_506,valid_out_507,valid_out_508,valid_out_509,valid_out_510,valid_out_511,valid_out_512,valid_out_513,
valid_out_514,valid_out_515,valid_out_516,valid_out_517,valid_out_518,valid_out_519,valid_out_520,valid_out_521,valid_out_522,
valid_out_523,valid_out_524,valid_out_525,valid_out_526,valid_out_527,valid_out_528,valid_out_529,valid_out_530,valid_out_531,
valid_out_532,valid_out_533,valid_out_534,valid_out_535,valid_out_536,valid_out_537,valid_out_538,valid_out_539,valid_out_540,
valid_out_541,valid_out_542,valid_out_543,valid_out_544,valid_out_545,valid_out_546,valid_out_547,valid_out_548,valid_out_549,
valid_out_550,valid_out_551,valid_out_552,valid_out_553,valid_out_554,valid_out_555,valid_out_556,valid_out_557,valid_out_558,
valid_out_559,valid_out_560,valid_out_561,valid_out_562,valid_out_563,valid_out_564,valid_out_565,valid_out_566,valid_out_567,
valid_out_568,valid_out_569,valid_out_570,valid_out_571,valid_out_572,valid_out_573,valid_out_574,valid_out_575,valid_out_576,
valid_out_577,valid_out_578,valid_out_579,valid_out_580,valid_out_581,valid_out_582,valid_out_583,valid_out_584,valid_out_585,
valid_out_586,valid_out_587,valid_out_588,valid_out_589,valid_out_590,valid_out_591,valid_out_592,valid_out_593,valid_out_594,
valid_out_595,valid_out_596,valid_out_597,valid_out_598,valid_out_599,valid_out_600,valid_out_601,valid_out_602,valid_out_603,
valid_out_604,valid_out_605,valid_out_606,valid_out_607,valid_out_608,valid_out_609,valid_out_610,valid_out_611,valid_out_612,
valid_out_613,valid_out_614,valid_out_615,valid_out_616,valid_out_617,valid_out_618,valid_out_619,valid_out_620,valid_out_621,
valid_out_622,valid_out_623,valid_out_624,valid_out_625,valid_out_626,valid_out_627,valid_out_628,valid_out_629,valid_out_630,
valid_out_631,valid_out_632,valid_out_633,valid_out_634,valid_out_635,valid_out_636,valid_out_637,valid_out_638,valid_out_639,
valid_out_640,valid_out_641,valid_out_642,valid_out_643,valid_out_644,valid_out_645,valid_out_646,valid_out_647,valid_out_648,
valid_out_649,valid_out_650,valid_out_651,valid_out_652,valid_out_653,valid_out_654,valid_out_655,valid_out_656,valid_out_657,
valid_out_658,valid_out_659,valid_out_660,valid_out_661,valid_out_662,valid_out_663,valid_out_664,valid_out_665,valid_out_666,
valid_out_667,valid_out_668,valid_out_669,valid_out_670,valid_out_671,valid_out_672,valid_out_673,valid_out_674,valid_out_675,
valid_out_676,valid_out_677,valid_out_678,valid_out_679,valid_out_680,valid_out_681,valid_out_682,valid_out_683,valid_out_684,
valid_out_685,valid_out_686,valid_out_687,valid_out_688,valid_out_689,valid_out_690,valid_out_691,valid_out_692,valid_out_693,
valid_out_694,valid_out_695,valid_out_696,valid_out_697,valid_out_698,valid_out_699,valid_out_700,valid_out_701,valid_out_702,
valid_out_703,valid_out_704,valid_out_705,valid_out_706,valid_out_707,valid_out_708,valid_out_709,valid_out_710,valid_out_711,
valid_out_712,valid_out_713,valid_out_714,valid_out_715,valid_out_716,valid_out_717,valid_out_718,valid_out_719,valid_out_720,
valid_out_721,valid_out_722,valid_out_723,valid_out_724,valid_out_725,valid_out_726,valid_out_727,valid_out_728,valid_out_729,
valid_out_730,valid_out_731,valid_out_732,valid_out_733,valid_out_734,valid_out_735,valid_out_736,valid_out_737,valid_out_738,
valid_out_739,valid_out_740,valid_out_741,valid_out_742,valid_out_743,valid_out_744,valid_out_745,valid_out_746,valid_out_747,
valid_out_748,valid_out_749,valid_out_750,valid_out_751,valid_out_752,valid_out_753,valid_out_754,valid_out_755,valid_out_756,
valid_out_757,valid_out_758,valid_out_759,valid_out_760,valid_out_761,valid_out_762,valid_out_763,valid_out_764,valid_out_765,
valid_out_766,valid_out_767,valid_out_768,valid_out_769,valid_out_770,valid_out_771,valid_out_772,valid_out_773,valid_out_774,
valid_out_775,valid_out_776,valid_out_777,valid_out_778,valid_out_779,valid_out_780,valid_out_781,valid_out_782,valid_out_783,
valid_out_784,valid_out_785,valid_out_786,valid_out_787,valid_out_788,valid_out_789,valid_out_790,valid_out_791,valid_out_792,
valid_out_793,valid_out_794,valid_out_795,valid_out_796,valid_out_797,valid_out_798,valid_out_799,valid_out_800,valid_out_801,
valid_out_802,valid_out_803,valid_out_804,valid_out_805,valid_out_806,valid_out_807,valid_out_808,valid_out_809,valid_out_810,
valid_out_811,valid_out_812,valid_out_813,valid_out_814,valid_out_815,valid_out_816,valid_out_817,valid_out_818,valid_out_819,
valid_out_820,valid_out_821,valid_out_822,valid_out_823,valid_out_824,valid_out_825,valid_out_826,valid_out_827,valid_out_828,
valid_out_829,valid_out_830,valid_out_831,valid_out_832,valid_out_833,valid_out_834,valid_out_835,valid_out_836,valid_out_837,
valid_out_838,valid_out_839,valid_out_840,valid_out_841,valid_out_842,valid_out_843,valid_out_844,valid_out_845,valid_out_846,
valid_out_847,valid_out_848,valid_out_849,valid_out_850,valid_out_851,valid_out_852,valid_out_853,valid_out_854,valid_out_855,
valid_out_856,valid_out_857,valid_out_858,valid_out_859,valid_out_860,valid_out_861,valid_out_862,valid_out_863,valid_out_864,
valid_out_865,valid_out_866,valid_out_867,valid_out_868,valid_out_869,valid_out_870,valid_out_871,valid_out_872,valid_out_873,
valid_out_874,valid_out_875,valid_out_876,valid_out_877,valid_out_878,valid_out_879,valid_out_880,valid_out_881,valid_out_882,
valid_out_883,valid_out_884,valid_out_885,valid_out_886,valid_out_887,valid_out_888,valid_out_889,valid_out_890,valid_out_891,
valid_out_892,valid_out_893,valid_out_894,valid_out_895,valid_out_896,valid_out_897,valid_out_898,valid_out_899,valid_out_900,
valid_out_901,valid_out_902,valid_out_903,valid_out_904,valid_out_905,valid_out_906,valid_out_907,valid_out_908,valid_out_909,
valid_out_910,valid_out_911,valid_out_912,valid_out_913,valid_out_914,valid_out_915,valid_out_916,valid_out_917,valid_out_918,
valid_out_919,valid_out_920,valid_out_921,valid_out_922,valid_out_923,valid_out_924,valid_out_925,valid_out_926,valid_out_927,
valid_out_928,valid_out_929,valid_out_930,valid_out_931,valid_out_932,valid_out_933,valid_out_934,valid_out_935,valid_out_936,
valid_out_937,valid_out_938,valid_out_939,valid_out_940,valid_out_941,valid_out_942,valid_out_943,valid_out_944,valid_out_945,
valid_out_946,valid_out_947,valid_out_948,valid_out_949,valid_out_950,valid_out_951,valid_out_952,valid_out_953,valid_out_954,
valid_out_955,valid_out_956,valid_out_957,valid_out_958,valid_out_959,valid_out_960,valid_out_961,valid_out_962,valid_out_963,
valid_out_964,valid_out_965,valid_out_966,valid_out_967,valid_out_968,valid_out_969,valid_out_970,valid_out_971,valid_out_972,
valid_out_973,valid_out_974,valid_out_975,valid_out_976,valid_out_977,valid_out_978,valid_out_979,valid_out_980,valid_out_981,
valid_out_982,valid_out_983,valid_out_984,valid_out_985,valid_out_986,valid_out_987,valid_out_988,valid_out_989,valid_out_990,
valid_out_991,valid_out_992,valid_out_993,valid_out_994,valid_out_995,valid_out_996,valid_out_997,valid_out_998,valid_out_999,
valid_out_1000,valid_out_1001,valid_out_1002,valid_out_1003,valid_out_1004,valid_out_1005,valid_out_1006,valid_out_1007,valid_out_1008,
valid_out_1009,valid_out_1010,valid_out_1011,valid_out_1012,valid_out_1013,valid_out_1014,valid_out_1015,valid_out_1016,valid_out_1017,
valid_out_1018,valid_out_1019,valid_out_1020,valid_out_1021,valid_out_1022,valid_out_1023,valid_out_1024                    
);

//Channel 1
conv_33 #(D, DATA_WIDTH) x1(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b10111101101001001000111110010010),
.kernel_01(32'b00111101100011010111110011000110),
.kernel_02(32'b10111100011001010011101100000000),
.kernel_03(32'b00111100101111010001011110010010),
.kernel_04(32'b10111110011001001011101011110101),
.kernel_05(32'b00111101100110001101001000110011),
.kernel_06(32'b00111101001110110001011010011000),
.kernel_07(32'b00111000011101110010110111010001),
.kernel_08(32'b10111101101001100100101011010001),
.pxl_out(pxl_out_1), .valid_out(valid_out_1) );

//Channel 2
conv_33 #(D, DATA_WIDTH) x2(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b00111101000000110011011110001001),
.kernel_01(32'b00111101100010001000111111110000),
.kernel_02(32'b00111011000111000011010010001110),
.kernel_03(32'b10111011110101100000011101110010),
.kernel_04(32'b00111101001000000001010100011110),
.kernel_05(32'b00111100010101110011010000000111),
.kernel_06(32'b10111001100001001010011100011001),
.kernel_07(32'b10111101011000010011011111110100),
.kernel_08(32'b10111110000010110011000110100001),
.pxl_out(pxl_out_2), .valid_out(valid_out_2) );

//Channel 3
conv_33 #(D, DATA_WIDTH) x3(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111100111100000100101101001001),
.kernel_01(32'b10111101001001111110110010100100),
.kernel_02(32'b10111101100011100001010000001001),
.kernel_03(32'b00111101001110101000011000100101),
.kernel_04(32'b10111101100000000111000001001001),
.kernel_05(32'b10111101101000001011101000011111),
.kernel_06(32'b00111101011010101111100010110111),
.kernel_07(32'b10111101000010001100111010111001),
.kernel_08(32'b10111100111111110010100100101010),
.pxl_out(pxl_out_3), .valid_out(valid_out_3) );

//Channel 4
conv_33 #(D, DATA_WIDTH) x4(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111100001001100010111010000110),
.kernel_01(32'b10111101101010110001011011100010),
.kernel_02(32'b10111101101110001101001010011110),
.kernel_03(32'b00111101111010001110111101010001),
.kernel_04(32'b00111101000001110011110101111110),
.kernel_05(32'b10111110000100100000110010011000),
.kernel_06(32'b10111100110100000001101111000111),
.kernel_07(32'b10111100101101111010011101000111),
.kernel_08(32'b10111010010000111111010101011001),
.pxl_out(pxl_out_4), .valid_out(valid_out_4) );

//Channel 5
conv_33 #(D, DATA_WIDTH) x5(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111110100101111101010100100010),
.kernel_01(32'b10111100111100111010010100011000),
.kernel_02(32'b00111100011011001010101110100011),
.kernel_03(32'b00111101101000000000010010101111),
.kernel_04(32'b10111101011100111010101001011110),
.kernel_05(32'b00111101001011001100100111111010),
.kernel_06(32'b00111101001100111011111111001011),
.kernel_07(32'b10111100100000110111010010010011),
.kernel_08(32'b10111100000101011110110111111110),
.pxl_out(pxl_out_5), .valid_out(valid_out_5) );

//Channel 6
conv_33 #(D, DATA_WIDTH) x6(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111101111110111011100010000100),
.kernel_01(32'b00111101010110101000100110010111),
.kernel_02(32'b00111100011010101110111010010111),
.kernel_03(32'b00111110010000110010100000101011),
.kernel_04(32'b10111110001101000010101001000000),
.kernel_05(32'b00111101000010111111110111010110),
.kernel_06(32'b10111101010101101000110101111110),
.kernel_07(32'b00111011110111011010111100000100),
.kernel_08(32'b10111101000001110101100101111011),
.pxl_out(pxl_out_6), .valid_out(valid_out_6) );

//Channel 7
conv_33 #(D, DATA_WIDTH) x7(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111100011101010101011010100001),
.kernel_01(32'b10111101101111011110000000110000),
.kernel_02(32'b00111101001001000100101010011000),
.kernel_03(32'b00111100000110101010101011111000),
.kernel_04(32'b00111101001110000101100011000111),
.kernel_05(32'b10111011111010011011100101010001),
.kernel_06(32'b00111110001001110000101110100101),
.kernel_07(32'b00111101100101111001101000001000),
.kernel_08(32'b00111110001111011001101100010101),
.pxl_out(pxl_out_7), .valid_out(valid_out_7) );

//Channel 8
conv_33 #(D, DATA_WIDTH) x8(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b10111100010110001010010100010110),
.kernel_01(32'b00111101110000101110111000000110),
.kernel_02(32'b10111011100101011100110001101101),
.kernel_03(32'b00111101001100101111010001001000),
.kernel_04(32'b10111100111010000011111111010100),
.kernel_05(32'b10111011111101101111000010010110),
.kernel_06(32'b00111101101101110111100001001101),
.kernel_07(32'b00111100101010010101001110110000),
.kernel_08(32'b10111101010111000110111000100011),
.pxl_out(pxl_out_8), .valid_out(valid_out_8) );

//Channel 9
conv_33 #(D, DATA_WIDTH) x9(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111100000000110101100001101011),
.kernel_01(32'b00111011010011000101011110111111),
.kernel_02(32'b00111011111011111000000011101011),
.kernel_03(32'b00111101010000000101000111001101),
.kernel_04(32'b00111101000011111110101110111101),
.kernel_05(32'b10111101111110001100101111110100),
.kernel_06(32'b10111101100111001001100000101010),
.kernel_07(32'b00111011100000011100110001111100),
.kernel_08(32'b10111101010001100010001111000010),
.pxl_out(pxl_out_9), .valid_out(valid_out_9) );

//Channel 10
conv_33 #(D, DATA_WIDTH) x10(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111101010100101100100110100010),
.kernel_01(32'b00111101110100011010011011010100),
.kernel_02(32'b10111101100110010010000010110000),
.kernel_03(32'b10111101101000100111101100010100),
.kernel_04(32'b10111101101010111001000011001111),
.kernel_05(32'b10111100111000110010011100000110),
.kernel_06(32'b10111101101010111010000111001001),
.kernel_07(32'b10111100111101000000100011111101),
.kernel_08(32'b00111100000011100001011110101111),
.pxl_out(pxl_out_10), .valid_out(valid_out_10) );

//Channel 11
conv_33 #(D, DATA_WIDTH) x11(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111011111001001101110111010011),
.kernel_01(32'b10111101100011110100101100110110),
.kernel_02(32'b10111110010010110101101100101101),
.kernel_03(32'b10111010101110100111010000011101),
.kernel_04(32'b10111101010011111111010100111001),
.kernel_05(32'b00111101110101010000110000100110),
.kernel_06(32'b00111101101101101111111001001111),
.kernel_07(32'b00111011101011011100010011111100),
.kernel_08(32'b10111011101001010100111101110000),
.pxl_out(pxl_out_11), .valid_out(valid_out_11) );

//Channel 12
conv_33 #(D, DATA_WIDTH) x12(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b10111100110001010001010001101100),
.kernel_01(32'b10111101100011110111100101101010),
.kernel_02(32'b00111110001101000010111110111100),
.kernel_03(32'b10111101000010101100010010011100),
.kernel_04(32'b10111101110110110101001010001011),
.kernel_05(32'b10111100111100110001000111101111),
.kernel_06(32'b10111101110001110111101001011011),
.kernel_07(32'b10111101111111110010001011000110),
.kernel_08(32'b00111101110101100000010111010010),
.pxl_out(pxl_out_12), .valid_out(valid_out_12) );

//Channel 13
conv_33 #(D, DATA_WIDTH) x13(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b10111101110010011011010101100101),
.kernel_01(32'b10111110010101001110011100110010),
.kernel_02(32'b10111110000000001001101000000010),
.kernel_03(32'b00111101100100011110011000000000),
.kernel_04(32'b10111010101001101011000101011101),
.kernel_05(32'b00111100000010111100000110000100),
.kernel_06(32'b00111101111000110100100000101110),
.kernel_07(32'b00111100010100001110010001001110),
.kernel_08(32'b10111110001100101111101111001101),
.pxl_out(pxl_out_13), .valid_out(valid_out_13) );

//Channel 14
conv_33 #(D, DATA_WIDTH) x14(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b10111101111110011001110100011010),
.kernel_01(32'b00111100011001100101001110110001),
.kernel_02(32'b10111011011110000110100001010101),
.kernel_03(32'b00111100101000110010000111011011),
.kernel_04(32'b00111011011000000110010000000111),
.kernel_05(32'b00111010111101100100101001000110),
.kernel_06(32'b10111101011111111001111111000000),
.kernel_07(32'b10111101011000000010101000011000),
.kernel_08(32'b10111101101101111010011111110010),
.pxl_out(pxl_out_14), .valid_out(valid_out_14) );

//Channel 15
conv_33 #(D, DATA_WIDTH) x15(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b10111101010010000110011100010010),
.kernel_01(32'b10111101000001100011011010110101),
.kernel_02(32'b10111100111100011100100000001011),
.kernel_03(32'b10111110100010111010010000110101),
.kernel_04(32'b00111100011000111100011100111000),
.kernel_05(32'b00111101010100011010111000011010),
.kernel_06(32'b10111100100000110011010000000000),
.kernel_07(32'b00111101001000001111110110101101),
.kernel_08(32'b10111101001110100001000000110111),
.pxl_out(pxl_out_15), .valid_out(valid_out_15) );

//Channel 16
conv_33 #(D, DATA_WIDTH) x16(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111101110011000110111101011100),
.kernel_01(32'b00111101101101100111011101010011),
.kernel_02(32'b10111110000000110001101000001110),
.kernel_03(32'b00111110000011101101101000101110),
.kernel_04(32'b00111101100100010101010111111101),
.kernel_05(32'b00111100010111110111110100011101),
.kernel_06(32'b10111110001000001011000011100001),
.kernel_07(32'b10111100000111011111110111001111),
.kernel_08(32'b00111101001010111011111111110101),
.pxl_out(pxl_out_16), .valid_out(valid_out_16) );

//Channel 17
conv_33 #(D, DATA_WIDTH) x17(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111110011111100111010111000010),
.kernel_01(32'b00111110000100011110111011101101),
.kernel_02(32'b00111100100011011100111000111000),
.kernel_03(32'b10111010110011010010110001110011),
.kernel_04(32'b10111101100111111111000010100011),
.kernel_05(32'b00111110000101101111110001010101),
.kernel_06(32'b10111100011101101011101100000010),
.kernel_07(32'b00111101110001011111110011011101),
.kernel_08(32'b10111101010101110011101000011111),
.pxl_out(pxl_out_17), .valid_out(valid_out_17) );

//Channel 18
conv_33 #(D, DATA_WIDTH) x18(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111100101111001000100110010010),
.kernel_01(32'b10111101101100100010010001011101),
.kernel_02(32'b10111110000000011000000110111000),
.kernel_03(32'b10111101110101100011101101000000),
.kernel_04(32'b00111101110010110000001111110110),
.kernel_05(32'b10111110011010101010011111011000),
.kernel_06(32'b00111010110110101000011011001111),
.kernel_07(32'b00111101011000111011000011111101),
.kernel_08(32'b00111110100011001111110100101001),
.pxl_out(pxl_out_18), .valid_out(valid_out_18) );

//Channel 19
conv_33 #(D, DATA_WIDTH) x19(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111110011001001111011010011010),
.kernel_01(32'b00111011101000000000001000010001),
.kernel_02(32'b10111100000011111000001101001011),
.kernel_03(32'b10111100101111100011011110011011),
.kernel_04(32'b00111110011011001001000000001110),
.kernel_05(32'b10111101100100010111111011001000),
.kernel_06(32'b00111101001101000001110111011010),
.kernel_07(32'b00111011011011101100011001111111),
.kernel_08(32'b10111110000111101101011101000101),
.pxl_out(pxl_out_19), .valid_out(valid_out_19) );

//Channel 20
conv_33 #(D, DATA_WIDTH) x20(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111101011001111101110111011010),
.kernel_01(32'b00111101100110011110011000001111),
.kernel_02(32'b10111110011010111000010100110011),
.kernel_03(32'b00111101110011111011000010000111),
.kernel_04(32'b00111100110000000001111010110100),
.kernel_05(32'b00111110000000110011100100000111),
.kernel_06(32'b00111100110000101100000010110101),
.kernel_07(32'b00111101101110101000111000001111),
.kernel_08(32'b10111110001001010011011011111111),
.pxl_out(pxl_out_20), .valid_out(valid_out_20) );

//Channel 21
conv_33 #(D, DATA_WIDTH) x21(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b10111101110111111110011011001000),
.kernel_01(32'b00111110000001000110000001101001),
.kernel_02(32'b00111100100000010101001110001101),
.kernel_03(32'b00111101010000000011111110110001),
.kernel_04(32'b10111101011110001000101000101100),
.kernel_05(32'b00111101110000011101111010101001),
.kernel_06(32'b00111101001111011111011001100000),
.kernel_07(32'b00111101101110011010011011000100),
.kernel_08(32'b00111110100011001101101110010000),
.pxl_out(pxl_out_21), .valid_out(valid_out_21) );

//Channel 22
conv_33 #(D, DATA_WIDTH) x22(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b00111011110000001111001110110111),
.kernel_01(32'b00111101110000110101101101111000),
.kernel_02(32'b10111100000111001111001110111010),
.kernel_03(32'b10111101001000111001110000001000),
.kernel_04(32'b00111100111011101101100110001111),
.kernel_05(32'b00111101001000110001110000101111),
.kernel_06(32'b00111100000110001110110011111001),
.kernel_07(32'b10111100110101110110011110001111),
.kernel_08(32'b10111100000101010110000100101010),
.pxl_out(pxl_out_22), .valid_out(valid_out_22) );

//Channel 23
conv_33 #(D, DATA_WIDTH) x23(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b00111101101001000011010110110011),
.kernel_01(32'b00111101011101000111100010000101),
.kernel_02(32'b10111000010101111000101011001111),
.kernel_03(32'b00111101011110010110011101010010),
.kernel_04(32'b00111101100000100011001001100000),
.kernel_05(32'b00111110100110010010001001111001),
.kernel_06(32'b10111101001000111000010000011001),
.kernel_07(32'b10111011111111011001111000100110),
.kernel_08(32'b00111101101100011101111110001100),
.pxl_out(pxl_out_23), .valid_out(valid_out_23) );

//Channel 24
conv_33 #(D, DATA_WIDTH) x24(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b10111100111101100010000011101001),
.kernel_01(32'b00111101100001111100101100000011),
.kernel_02(32'b00111101111110101001101000011010),
.kernel_03(32'b00111011011100110000111111011001),
.kernel_04(32'b10111110001100111101101011101110),
.kernel_05(32'b10111101101010110011110100111011),
.kernel_06(32'b10111101000000011110010111111110),
.kernel_07(32'b10111101101110011000011100101100),
.kernel_08(32'b10111110010101011010101111110101),
.pxl_out(pxl_out_24), .valid_out(valid_out_24) );

//Channel 25
conv_33 #(D, DATA_WIDTH) x25(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111101001011000000101001110110),
.kernel_01(32'b00111010111110011110001010001010),
.kernel_02(32'b00111101101100011000110111000110),
.kernel_03(32'b10111110000000011100100100011001),
.kernel_04(32'b00111100001011111101010011010111),
.kernel_05(32'b10111100011000001101000100110001),
.kernel_06(32'b10111110000101011011111110011011),
.kernel_07(32'b00111101100011100010000011100100),
.kernel_08(32'b00111110010110011111000110010110),
.pxl_out(pxl_out_25), .valid_out(valid_out_25) );

//Channel 26
conv_33 #(D, DATA_WIDTH) x26(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b00111101110001010110000010110100),
.kernel_01(32'b00111101001100101100100011001101),
.kernel_02(32'b00111101001100001101111111100101),
.kernel_03(32'b10111011001000100101011101100101),
.kernel_04(32'b00111101100111110100010111101000),
.kernel_05(32'b10111010111100011000011001110100),
.kernel_06(32'b10111101010101000110101101111110),
.kernel_07(32'b00111011101010000000110010101000),
.kernel_08(32'b10111101000111010111110101000000),
.pxl_out(pxl_out_26), .valid_out(valid_out_26) );

//Channel 27
conv_33 #(D, DATA_WIDTH) x27(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b10111101111000100101111011001001),
.kernel_01(32'b00111110000001110100100100100100),
.kernel_02(32'b10111101101110100111011001000011),
.kernel_03(32'b10111110100100100100001000110111),
.kernel_04(32'b10111100111110101100011011100111),
.kernel_05(32'b10111011000000111100010010000001),
.kernel_06(32'b00111010101101000010100111111000),
.kernel_07(32'b10111101001001000101101101100110),
.kernel_08(32'b00111101001111110100101101000110),
.pxl_out(pxl_out_27), .valid_out(valid_out_27) );

//Channel 28
conv_33 #(D, DATA_WIDTH) x28(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111011100101000010011011100101),
.kernel_01(32'b10111101110101000000101111011000),
.kernel_02(32'b00111100100010100111011100111110),
.kernel_03(32'b10111100111111111000011111001111),
.kernel_04(32'b00111101100000000100000101011110),
.kernel_05(32'b10111100111100000111011101111011),
.kernel_06(32'b00111110000000101000000000111010),
.kernel_07(32'b00111101100011110010011111011010),
.kernel_08(32'b00111100110100111111001100001110),
.pxl_out(pxl_out_28), .valid_out(valid_out_28) );

//Channel 29
conv_33 #(D, DATA_WIDTH) x29(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111011110100111000011010010000),
.kernel_01(32'b10111100101011101110111101110000),
.kernel_02(32'b10111101100001111110110111110110),
.kernel_03(32'b10111100011011001101100010001010),
.kernel_04(32'b10111110011110010010001001000101),
.kernel_05(32'b00111100000001111111100100001001),
.kernel_06(32'b10111100111101001101110100100001),
.kernel_07(32'b00111100110110000100011100100110),
.kernel_08(32'b10111101001000011010110111000101),
.pxl_out(pxl_out_29), .valid_out(valid_out_29) );

//Channel 30
conv_33 #(D, DATA_WIDTH) x30(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111110101000001001110010001010),
.kernel_01(32'b00111100100010111101101111110101),
.kernel_02(32'b00111100100011110100010010011111),
.kernel_03(32'b10111101100100000110110010000011),
.kernel_04(32'b00111101010001101111110110101110),
.kernel_05(32'b00111101011011010001010111110101),
.kernel_06(32'b10111101100101101000110011011101),
.kernel_07(32'b00111101001111000000110111000011),
.kernel_08(32'b00111110011000010000000011110100),
.pxl_out(pxl_out_30), .valid_out(valid_out_30) );

//Channel 31
conv_33 #(D, DATA_WIDTH) x31(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b00111101111010011000111111001101),
.kernel_01(32'b10111101000001000111101100011111),
.kernel_02(32'b00111100101101001010000100101000),
.kernel_03(32'b10111110001010111101000001011101),
.kernel_04(32'b00111101010010011001110111001001),
.kernel_05(32'b10111101001110111111010100101101),
.kernel_06(32'b00111100100011101001100110111001),
.kernel_07(32'b10111101010000110000001100010100),
.kernel_08(32'b10111101010110000110101111001001),
.pxl_out(pxl_out_31), .valid_out(valid_out_31) );

//Channel 32
conv_33 #(D, DATA_WIDTH) x32(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111100100001001110010101011000),
.kernel_01(32'b10111100101010101000100100010101),
.kernel_02(32'b10111100101001111000010000110000),
.kernel_03(32'b00111101111111000000010101101100),
.kernel_04(32'b00111101001011000010100101001101),
.kernel_05(32'b00111101101011111101111101001101),
.kernel_06(32'b00111100000000001101101010111111),
.kernel_07(32'b00111110001011011000100101000110),
.kernel_08(32'b10111100111000001100011110110011),
.pxl_out(pxl_out_32), .valid_out(valid_out_32) );

//Channel 33
conv_33 #(D, DATA_WIDTH) x33(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111110011000101101110100000110),
.kernel_01(32'b00111101100011000100110100100000),
.kernel_02(32'b00111110010001100011100001111100),
.kernel_03(32'b00111110000001000100110111100010),
.kernel_04(32'b00111100011001000001111110101000),
.kernel_05(32'b10111101000110000111010100010101),
.kernel_06(32'b10111100101110110101000110100101),
.kernel_07(32'b10111110000111000001011011000111),
.kernel_08(32'b00111110000001001000000111111100),
.pxl_out(pxl_out_33), .valid_out(valid_out_33) );

//Channel 34
conv_33 #(D, DATA_WIDTH) x34(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111110011100010000000101010001),
.kernel_01(32'b00111101010100100101001111110100),
.kernel_02(32'b00111100010010111011110001011111),
.kernel_03(32'b00111100001101110101000101111001),
.kernel_04(32'b10111110011000110011111101101100),
.kernel_05(32'b00111100100111101001101011101001),
.kernel_06(32'b00111100111110011000001001110011),
.kernel_07(32'b00111101001000000110110110010011),
.kernel_08(32'b00111101011001010100110110011101),
.pxl_out(pxl_out_34), .valid_out(valid_out_34) );

//Channel 35
conv_33 #(D, DATA_WIDTH) x35(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b10111011111000101101110100011010),
.kernel_01(32'b10111100111100110101010100111101),
.kernel_02(32'b10111110000110101001111010100011),
.kernel_03(32'b10111101111010000000110110111000),
.kernel_04(32'b10111011100001100010101000011101),
.kernel_05(32'b10111110001011110010100011111100),
.kernel_06(32'b10111110000011011100100000101001),
.kernel_07(32'b00111110000001000011111000111110),
.kernel_08(32'b10111101110010100111111111100110),
.pxl_out(pxl_out_35), .valid_out(valid_out_35) );

//Channel 36
conv_33 #(D, DATA_WIDTH) x36(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b10111100010110011111100101110001),
.kernel_01(32'b00111110000000100111010001101011),
.kernel_02(32'b10111110001110100000010101001100),
.kernel_03(32'b00111100101100011000111110001001),
.kernel_04(32'b00111101010011001001100000100000),
.kernel_05(32'b00111101101000100001101111100110),
.kernel_06(32'b10111101001101101001000010101111),
.kernel_07(32'b00111101010101001101101100000111),
.kernel_08(32'b10111101100100010011111010010110),
.pxl_out(pxl_out_36), .valid_out(valid_out_36) );

//Channel 37
conv_33 #(D, DATA_WIDTH) x37(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111100001010000110110001001111),
.kernel_01(32'b00111100101101101101010011111001),
.kernel_02(32'b10111100011111110101110100011100),
.kernel_03(32'b10111011000100010010100000010100),
.kernel_04(32'b00111101100001000010000110001010),
.kernel_05(32'b10111101000100110100100101000000),
.kernel_06(32'b00111101110111011100001110110110),
.kernel_07(32'b00111110010101001100111010011111),
.kernel_08(32'b00111101110010001010000001111010),
.pxl_out(pxl_out_37), .valid_out(valid_out_37) );

//Channel 38
conv_33 #(D, DATA_WIDTH) x38(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b10111100110110110111011110001010),
.kernel_01(32'b10111101100010111010111110010000),
.kernel_02(32'b10111100010110000011010100110010),
.kernel_03(32'b10111110000100110111101110011010),
.kernel_04(32'b00111110001101000111000101000100),
.kernel_05(32'b00111101001101000100101000000011),
.kernel_06(32'b00111100110100001010101100110010),
.kernel_07(32'b10111101101000010100001110010001),
.kernel_08(32'b10111101001101010101000001101110),
.pxl_out(pxl_out_38), .valid_out(valid_out_38) );

//Channel 39
conv_33 #(D, DATA_WIDTH) x39(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111101101111000100101001100110),
.kernel_01(32'b10111011101001010000111001001001),
.kernel_02(32'b00111100100110101011110000111110),
.kernel_03(32'b00111100111000100101010010111001),
.kernel_04(32'b00111101011000001010111111010100),
.kernel_05(32'b10111101001110000101001111000101),
.kernel_06(32'b10111110001000011001101011000110),
.kernel_07(32'b00111100111100001000101100000001),
.kernel_08(32'b10111110001110001100000110101000),
.pxl_out(pxl_out_39), .valid_out(valid_out_39) );

//Channel 40
conv_33 #(D, DATA_WIDTH) x40(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b10111101000110100011000101000101),
.kernel_01(32'b10111110010000101100001000101001),
.kernel_02(32'b10111100111010110000110000011101),
.kernel_03(32'b10111101001111111011010111111110),
.kernel_04(32'b00111101100001101110110000000011),
.kernel_05(32'b00111101001001100111111010111001),
.kernel_06(32'b10111101011010001010101001000011),
.kernel_07(32'b10111100111110000000010011000000),
.kernel_08(32'b00111110011110011110100001111101),
.pxl_out(pxl_out_40), .valid_out(valid_out_40) );

//Channel 41
conv_33 #(D, DATA_WIDTH) x41(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111101001101100110010111101000),
.kernel_01(32'b10111100111111010010011110111100),
.kernel_02(32'b00111101100000011011110001110000),
.kernel_03(32'b10111110000101001011110001001011),
.kernel_04(32'b10111100001110011000111010000000),
.kernel_05(32'b00111110001011111110111110001011),
.kernel_06(32'b10111111010000101010100000111101),
.kernel_07(32'b10111101111110101000010011110000),
.kernel_08(32'b00111101110111010101101100110100),
.pxl_out(pxl_out_41), .valid_out(valid_out_41) );

//Channel 42
conv_33 #(D, DATA_WIDTH) x42(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b10111110000111100111001011011011),
.kernel_01(32'b00111100010010011000001000000011),
.kernel_02(32'b00111101101110101100100001010010),
.kernel_03(32'b00111100111111101000001111001110),
.kernel_04(32'b10111101001111010101000110001110),
.kernel_05(32'b00111101000011010100010100010001),
.kernel_06(32'b00111100101010001111010010100100),
.kernel_07(32'b10111101101110001100001010110010),
.kernel_08(32'b10111101101000110111010111010011),
.pxl_out(pxl_out_42), .valid_out(valid_out_42) );

//Channel 43
conv_33 #(D, DATA_WIDTH) x43(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b00111111001011101110101100000100),
.kernel_01(32'b10111101010100101101010001000101),
.kernel_02(32'b00111110010000011101111010011110),
.kernel_03(32'b00111100100001101011100110010101),
.kernel_04(32'b00111110001101001101111110010001),
.kernel_05(32'b10111110110110111001001011111000),
.kernel_06(32'b10111101011010010010011101110100),
.kernel_07(32'b10111110000000101001101010000000),
.kernel_08(32'b00111101100000001010011100110011),
.pxl_out(pxl_out_43), .valid_out(valid_out_43) );

//Channel 44
conv_33 #(D, DATA_WIDTH) x44(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111100011010001111111000111110),
.kernel_01(32'b00111011001001001101000101011110),
.kernel_02(32'b10111101110000000010011101001000),
.kernel_03(32'b00111101001110111111110000111100),
.kernel_04(32'b10111100011011010101010001010100),
.kernel_05(32'b10111011100010101000101010101101),
.kernel_06(32'b10111101111110000001110110010101),
.kernel_07(32'b00111101101001111100010101100010),
.kernel_08(32'b10111100011010101110101111000011),
.pxl_out(pxl_out_44), .valid_out(valid_out_44) );

//Channel 45
conv_33 #(D, DATA_WIDTH) x45(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111100001101110110101000010010),
.kernel_01(32'b10111101011000101100111011111101),
.kernel_02(32'b00111100100100101111111100000011),
.kernel_03(32'b00111101000100110110101110000110),
.kernel_04(32'b10111101000001110110101011011101),
.kernel_05(32'b10111100101111111101100000011110),
.kernel_06(32'b10111101010100111001110101100001),
.kernel_07(32'b00111101001101110100100100010010),
.kernel_08(32'b10111100101011000011001011110110),
.pxl_out(pxl_out_45), .valid_out(valid_out_45) );

//Channel 46
conv_33 #(D, DATA_WIDTH) x46(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111101011101011001100010011000),
.kernel_01(32'b10111101001001101100011111010001),
.kernel_02(32'b00111101001111100110001110011000),
.kernel_03(32'b00111010101101101101111110011111),
.kernel_04(32'b00111101000111111111000001001110),
.kernel_05(32'b00111001100000011101000101111011),
.kernel_06(32'b00111101100000110111111111000100),
.kernel_07(32'b10111101111010110010010110000110),
.kernel_08(32'b10111100111111010101000011011111),
.pxl_out(pxl_out_46), .valid_out(valid_out_46) );

//Channel 47
conv_33 #(D, DATA_WIDTH) x47(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b10111101011100111101011110000111),
.kernel_01(32'b10111101001100110011010010001111),
.kernel_02(32'b10111110100110110010001011000001),
.kernel_03(32'b00111101101011001111011100000010),
.kernel_04(32'b00111110000001010001110011110110),
.kernel_05(32'b10111101001011111011010000101111),
.kernel_06(32'b10111011000111101010110000111110),
.kernel_07(32'b00111100000011110101111101000000),
.kernel_08(32'b10111110000110001011011111111111),
.pxl_out(pxl_out_47), .valid_out(valid_out_47) );

//Channel 48
conv_33 #(D, DATA_WIDTH) x48(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b00111110010111011010101100001111),
.kernel_01(32'b10111101111010111100011110010111),
.kernel_02(32'b10111100100101110100110100000011),
.kernel_03(32'b00111101011010101100111100100001),
.kernel_04(32'b00111101000011000010010111111111),
.kernel_05(32'b10111011100100001011111011010100),
.kernel_06(32'b00111110100101000100101111110001),
.kernel_07(32'b10111100110100010011101000100001),
.kernel_08(32'b00111100001100011000001110011000),
.pxl_out(pxl_out_48), .valid_out(valid_out_48) );

//Channel 49
conv_33 #(D, DATA_WIDTH) x49(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111110001000101010011100011011),
.kernel_01(32'b00111100101100111101011001000111),
.kernel_02(32'b10111110010011111100011111101000),
.kernel_03(32'b00111101011000001000010110001101),
.kernel_04(32'b00111101100111000010110100000100),
.kernel_05(32'b00111101101101001010000110011011),
.kernel_06(32'b10111101100101000100001111110011),
.kernel_07(32'b00111101110101000101110001010010),
.kernel_08(32'b10111110100000111011100111000010),
.pxl_out(pxl_out_49), .valid_out(valid_out_49) );

//Channel 50
conv_33 #(D, DATA_WIDTH) x50(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111101110100100011001000000000),
.kernel_01(32'b00111101001100100101000011111011),
.kernel_02(32'b00111101001011111001011011001100),
.kernel_03(32'b00111101100110111011000110011111),
.kernel_04(32'b10111010000010000110000000111010),
.kernel_05(32'b10111100101111011010100000000110),
.kernel_06(32'b00111101001101110000001101100010),
.kernel_07(32'b10111110000100100000101000001000),
.kernel_08(32'b00111100101111010011011101101010),
.pxl_out(pxl_out_50), .valid_out(valid_out_50) );

//Channel 51
conv_33 #(D, DATA_WIDTH) x51(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111101101000011110010101111001),
.kernel_01(32'b00111100110100110011001000110010),
.kernel_02(32'b00111110000111110001100110110000),
.kernel_03(32'b00111100111101111101101101011001),
.kernel_04(32'b10111101010001101000011100100000),
.kernel_05(32'b00111011101111101000011000000011),
.kernel_06(32'b10111100111101010110000110101001),
.kernel_07(32'b00111100000001011010010011100101),
.kernel_08(32'b00111100100111111100101101010110),
.pxl_out(pxl_out_51), .valid_out(valid_out_51) );

//Channel 52
conv_33 #(D, DATA_WIDTH) x52(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111010111101001101100101001001),
.kernel_01(32'b00111011110001010101110111111010),
.kernel_02(32'b00111110000101101000011110010011),
.kernel_03(32'b10111010110000101100010101110011),
.kernel_04(32'b10111101000000001110100010100001),
.kernel_05(32'b10111101100001010101001110100100),
.kernel_06(32'b10111110001001111100010011000101),
.kernel_07(32'b00111010010111011001010001111010),
.kernel_08(32'b00111101000111100101010100101110),
.pxl_out(pxl_out_52), .valid_out(valid_out_52) );

//Channel 53
conv_33 #(D, DATA_WIDTH) x53(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b10111100100000101111110100111110),
.kernel_01(32'b10111101100011111111111000101101),
.kernel_02(32'b10111101000010010010000010100100),
.kernel_03(32'b00111101100101100110011001001000),
.kernel_04(32'b10111010001100110110000111111101),
.kernel_05(32'b10111100110001110000000001100000),
.kernel_06(32'b10111101100011001110111011000001),
.kernel_07(32'b00111011000110001000011001010000),
.kernel_08(32'b00111101011111100000010001010110),
.pxl_out(pxl_out_53), .valid_out(valid_out_53) );

//Channel 54
conv_33 #(D, DATA_WIDTH) x54(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b00111100001101010000111010100101),
.kernel_01(32'b00111110001100101010011000101001),
.kernel_02(32'b00111101001111101101001110001100),
.kernel_03(32'b00111110010101110001011011000000),
.kernel_04(32'b10111100111111010010111000101100),
.kernel_05(32'b00111101100001111001101001110000),
.kernel_06(32'b00111100111111101011010010111100),
.kernel_07(32'b00111100111010101001000011110001),
.kernel_08(32'b00111101111110110000000011101011),
.pxl_out(pxl_out_54), .valid_out(valid_out_54) );

//Channel 55
conv_33 #(D, DATA_WIDTH) x55(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111011101111101111100010100011),
.kernel_01(32'b10111100001101011001101111100010),
.kernel_02(32'b00111101100011101101010100010010),
.kernel_03(32'b00111100100010110010001011000100),
.kernel_04(32'b10111101001001010000110011000110),
.kernel_05(32'b10111101100101101101010111011011),
.kernel_06(32'b00111101001111011110001100101101),
.kernel_07(32'b10111110010101010110010010111010),
.kernel_08(32'b10111101100001101001101010110101),
.pxl_out(pxl_out_55), .valid_out(valid_out_55) );

//Channel 56
conv_33 #(D, DATA_WIDTH) x56(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b10111110011000111011011100101110),
.kernel_01(32'b10111100000010101100111000111101),
.kernel_02(32'b00111101100101001110100111101110),
.kernel_03(32'b00111100100000000111100101011011),
.kernel_04(32'b00111101011011111010001010111010),
.kernel_05(32'b00111100001000010111011011000111),
.kernel_06(32'b10111101100101110110000100101011),
.kernel_07(32'b00111100110011010001101110110010),
.kernel_08(32'b00111101011110111000101101000101),
.pxl_out(pxl_out_56), .valid_out(valid_out_56) );

//Channel 57
conv_33 #(D, DATA_WIDTH) x57(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111011101011001111010011111000),
.kernel_01(32'b10111101110011100101111110111010),
.kernel_02(32'b10111110000110111000101001110011),
.kernel_03(32'b00111101000100101001101101110101),
.kernel_04(32'b10111110000111000110111011010101),
.kernel_05(32'b00111101001000100001011101111100),
.kernel_06(32'b10111110000000011100011100000110),
.kernel_07(32'b00111110000110111011000000110100),
.kernel_08(32'b00111011110001001100100111001000),
.pxl_out(pxl_out_57), .valid_out(valid_out_57) );

//Channel 58
conv_33 #(D, DATA_WIDTH) x58(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b00111011011011111111110010101011),
.kernel_01(32'b10111101001101011010001001110100),
.kernel_02(32'b00111101001011010011000100000010),
.kernel_03(32'b00111101010011010101111100010001),
.kernel_04(32'b10111110010001011110100111100100),
.kernel_05(32'b10111100000111100011011010101111),
.kernel_06(32'b00111101001001100000011100111010),
.kernel_07(32'b00111100000010011110101011010111),
.kernel_08(32'b00111101110101111001111000101001),
.pxl_out(pxl_out_58), .valid_out(valid_out_58) );

//Channel 59
conv_33 #(D, DATA_WIDTH) x59(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111101010111111111011100000100),
.kernel_01(32'b10111101000011000100011100001111),
.kernel_02(32'b10111100010000000100001111111010),
.kernel_03(32'b10111100000000011100000100001101),
.kernel_04(32'b10111110111010000111101101111101),
.kernel_05(32'b10111110100111110010010101001000),
.kernel_06(32'b00111101111011011111110001110101),
.kernel_07(32'b00111100100011101111100100011001),
.kernel_08(32'b00111100001001010001110011011100),
.pxl_out(pxl_out_59), .valid_out(valid_out_59) );

//Channel 60
conv_33 #(D, DATA_WIDTH) x60(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111110000100011001011110000111),
.kernel_01(32'b00111101100100111100001101010000),
.kernel_02(32'b10111100000010000000101000101101),
.kernel_03(32'b10111010110011110011100100000001),
.kernel_04(32'b10111101001001011100101110011011),
.kernel_05(32'b10111011101000110111011010111110),
.kernel_06(32'b10111110011001011001100001111111),
.kernel_07(32'b00111111000111111101101001100110),
.kernel_08(32'b00111100000001000110010010101110),
.pxl_out(pxl_out_60), .valid_out(valid_out_60) );

//Channel 61
conv_33 #(D, DATA_WIDTH) x61(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111101100111100001110000111110),
.kernel_01(32'b10111100010100001001111010001101),
.kernel_02(32'b10111100110011001001111111000011),
.kernel_03(32'b10111100111110001011000110100010),
.kernel_04(32'b10111110100100010001100101000011),
.kernel_05(32'b10111101100101100110000001111000),
.kernel_06(32'b10111110010000111111010000010111),
.kernel_07(32'b10111101110110011101101000100100),
.kernel_08(32'b00111100100001000111100110000111),
.pxl_out(pxl_out_61), .valid_out(valid_out_61) );

//Channel 62
conv_33 #(D, DATA_WIDTH) x62(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b00111100100001001111010010011010),
.kernel_01(32'b10111110010010001001010011011000),
.kernel_02(32'b00111101010111000110011100000100),
.kernel_03(32'b10111101110010010110001000101100),
.kernel_04(32'b10111101010000110110001001100110),
.kernel_05(32'b00111110000000000111000011000110),
.kernel_06(32'b10111101001111110001101010111001),
.kernel_07(32'b00111101010001011101000101100110),
.kernel_08(32'b00111110111111100011110000001010),
.pxl_out(pxl_out_62), .valid_out(valid_out_62) );

//Channel 63
conv_33 #(D, DATA_WIDTH) x63(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111011001000001101111110010001),
.kernel_01(32'b10111101000001000010001101110110),
.kernel_02(32'b00111100100101111111100011001000),
.kernel_03(32'b10111101000000101100111100110001),
.kernel_04(32'b10111100111010001101001110000110),
.kernel_05(32'b00111101000111011110101110011101),
.kernel_06(32'b00111011010000001111011000110001),
.kernel_07(32'b00111101010010011000001000100000),
.kernel_08(32'b10111101000110111111000111101001),
.pxl_out(pxl_out_63), .valid_out(valid_out_63) );

//Channel 64
conv_33 #(D, DATA_WIDTH) x64(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111100111110011010011111111110),
.kernel_01(32'b00111011111001001101111000000110),
.kernel_02(32'b00111101001011101011100111001101),
.kernel_03(32'b00111101100101010100111111111101),
.kernel_04(32'b00111100111100000011100011101110),
.kernel_05(32'b10111100010010001010111001010101),
.kernel_06(32'b00111110100010100001010100111100),
.kernel_07(32'b00111101100111010101111101101010),
.kernel_08(32'b10111100010110000111010011011010),
.pxl_out(pxl_out_64), .valid_out(valid_out_64) );

//Channel 65
conv_33 #(D, DATA_WIDTH) x65(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111110001110011100001000101110),
.kernel_01(32'b10111101010000100101010100110010),
.kernel_02(32'b00111101010001010101010100010101),
.kernel_03(32'b00111011111110110111100110110100),
.kernel_04(32'b10111101000000100101000010111000),
.kernel_05(32'b00111110101010101110110111001101),
.kernel_06(32'b00111011111001011010011001010001),
.kernel_07(32'b00111100100011001110101000111101),
.kernel_08(32'b10111101000000101001000101011110),
.pxl_out(pxl_out_65), .valid_out(valid_out_65) );

//Channel 66
conv_33 #(D, DATA_WIDTH) x66(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b00111101000101110011111001101100),
.kernel_01(32'b10111101100110010111101111111100),
.kernel_02(32'b10111101100000100100110010011011),
.kernel_03(32'b00111110000100001110111100101011),
.kernel_04(32'b10111110001100101010010111100000),
.kernel_05(32'b10111110110001110111110110101001),
.kernel_06(32'b10111101110000001001110011001100),
.kernel_07(32'b10111101101100011111000111110111),
.kernel_08(32'b00111101101101001001000000100011),
.pxl_out(pxl_out_66), .valid_out(valid_out_66) );

//Channel 67
conv_33 #(D, DATA_WIDTH) x67(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111101000000100111111000100001),
.kernel_01(32'b10111100011000110101010110101110),
.kernel_02(32'b00111101001111101101001010100001),
.kernel_03(32'b10111110000100110111011010111101),
.kernel_04(32'b00111101101000101001101100100110),
.kernel_05(32'b00111101111011111000100000001100),
.kernel_06(32'b10111100100010100101001010010100),
.kernel_07(32'b00111101101110001101100001111010),
.kernel_08(32'b10111101100110010100001101111111),
.pxl_out(pxl_out_67), .valid_out(valid_out_67) );

//Channel 68
conv_33 #(D, DATA_WIDTH) x68(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111011100100011101110100111110),
.kernel_01(32'b10111101110111000111101011111100),
.kernel_02(32'b00111110000000101111001011111111),
.kernel_03(32'b10111101101111101011001001101000),
.kernel_04(32'b10111100111000010100100000001100),
.kernel_05(32'b10111110011000100010101001000101),
.kernel_06(32'b00111101110011001000010101100110),
.kernel_07(32'b10111100100111100110101101110010),
.kernel_08(32'b10111100110010001011100000001111),
.pxl_out(pxl_out_68), .valid_out(valid_out_68) );

//Channel 69
conv_33 #(D, DATA_WIDTH) x69(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b10111101100100000110000000000110),
.kernel_01(32'b00111101001100010000011101010000),
.kernel_02(32'b00111011100110111010100011011101),
.kernel_03(32'b00111100011010010100011101011001),
.kernel_04(32'b10111110001001101010111110111011),
.kernel_05(32'b00111101100010111011111010100011),
.kernel_06(32'b00111101010100000100100000111010),
.kernel_07(32'b00111101001110011111111000111100),
.kernel_08(32'b00111100101001100100100110000010),
.pxl_out(pxl_out_69), .valid_out(valid_out_69) );

//Channel 70
conv_33 #(D, DATA_WIDTH) x70(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111110100000010110100011011001),
.kernel_01(32'b10111100010101011111111111001000),
.kernel_02(32'b10111100111100010100100001101110),
.kernel_03(32'b00111101001111111011011101111010),
.kernel_04(32'b10111110010011110101101011110000),
.kernel_05(32'b00111101101001001011010110101000),
.kernel_06(32'b00111101001100100110011100110000),
.kernel_07(32'b10111101111100011101101010010110),
.kernel_08(32'b00111101000101110110101001100001),
.pxl_out(pxl_out_70), .valid_out(valid_out_70) );

//Channel 71
conv_33 #(D, DATA_WIDTH) x71(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111101100010111000011111100101),
.kernel_01(32'b10111101111011101010011101010110),
.kernel_02(32'b00111101001100010010000011101100),
.kernel_03(32'b10111100110111111100110100000101),
.kernel_04(32'b00111100101010111110111101000011),
.kernel_05(32'b00111100001110000110010110111001),
.kernel_06(32'b00111101110101111011111110001111),
.kernel_07(32'b10111101100001010101011101001001),
.kernel_08(32'b00111110010111111011110110000111),
.pxl_out(pxl_out_71), .valid_out(valid_out_71) );

//Channel 72
conv_33 #(D, DATA_WIDTH) x72(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b10111100010110011111100011000111),
.kernel_01(32'b10111110001000010101101000101011),
.kernel_02(32'b00111100110001001000001001110000),
.kernel_03(32'b10111100001011111111010101111100),
.kernel_04(32'b00111100101100001100101000010100),
.kernel_05(32'b10111101101011101011101011101001),
.kernel_06(32'b00111110001110110111100010110011),
.kernel_07(32'b00111101100011100000000011110111),
.kernel_08(32'b10111101110011110110100111010011),
.pxl_out(pxl_out_72), .valid_out(valid_out_72) );

//Channel 73
conv_33 #(D, DATA_WIDTH) x73(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111100111100111111100010000110),
.kernel_01(32'b00111100100010010000011000011010),
.kernel_02(32'b00111011110101011111110101100101),
.kernel_03(32'b00111100000110000101111111010100),
.kernel_04(32'b10111100010001011011101110010101),
.kernel_05(32'b00111101110111100001101000101000),
.kernel_06(32'b10111110010010011110001000101100),
.kernel_07(32'b00111101000100011110100001001110),
.kernel_08(32'b10111100011110001001100111110010),
.pxl_out(pxl_out_73), .valid_out(valid_out_73) );

//Channel 74
conv_33 #(D, DATA_WIDTH) x74(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b10111110000011000011110010101111),
.kernel_01(32'b00111011000001001101111110000110),
.kernel_02(32'b10111100001100111111110010100110),
.kernel_03(32'b10111101000111010100100110011011),
.kernel_04(32'b10111100000000011000001101001011),
.kernel_05(32'b10111101100001100011000110001011),
.kernel_06(32'b10111101000001100000001100101101),
.kernel_07(32'b00111101000101011110011101001000),
.kernel_08(32'b00111100000010001111111011111011),
.pxl_out(pxl_out_74), .valid_out(valid_out_74) );

//Channel 75
conv_33 #(D, DATA_WIDTH) x75(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111100100010010010010010011111),
.kernel_01(32'b10111010111011011001010010001000),
.kernel_02(32'b00111101010011111011010110111101),
.kernel_03(32'b10111101011000000101001000101010),
.kernel_04(32'b00111101111000101000110010111110),
.kernel_05(32'b10111101011111101111110111000001),
.kernel_06(32'b10111010110000000111011100110101),
.kernel_07(32'b00111010101111110101010010110111),
.kernel_08(32'b00111110000011111110111000011000),
.pxl_out(pxl_out_75), .valid_out(valid_out_75) );

//Channel 76
conv_33 #(D, DATA_WIDTH) x76(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111110010000010000110110100011),
.kernel_01(32'b10111011011001111100001110110010),
.kernel_02(32'b00111100100001000011010101110000),
.kernel_03(32'b00111101100110110100110101110101),
.kernel_04(32'b00111101001101011111110110100101),
.kernel_05(32'b10111101000101010101101000110100),
.kernel_06(32'b00111100000100100100011001111010),
.kernel_07(32'b00111100101100111101000111101010),
.kernel_08(32'b10111101111001011010010000011001),
.pxl_out(pxl_out_76), .valid_out(valid_out_76) );

//Channel 77
conv_33 #(D, DATA_WIDTH) x77(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111101110100001111100011101100),
.kernel_01(32'b10111011111101001111111011101000),
.kernel_02(32'b00111101100011011100100110111001),
.kernel_03(32'b10111101000101000000111011001100),
.kernel_04(32'b00111101101010100001101101111111),
.kernel_05(32'b10111101111010110111100000101110),
.kernel_06(32'b10111101111100110110000011011011),
.kernel_07(32'b10111101000010101010111100110000),
.kernel_08(32'b10111100111101111001000011101101),
.pxl_out(pxl_out_77), .valid_out(valid_out_77) );

//Channel 78
conv_33 #(D, DATA_WIDTH) x78(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111101000011110100100101100011),
.kernel_01(32'b10111100000110101111010010101111),
.kernel_02(32'b10111110010101101010001000010010),
.kernel_03(32'b00111110000010000110110101000011),
.kernel_04(32'b10111100010110101110001011100001),
.kernel_05(32'b00111101011010010110110111001010),
.kernel_06(32'b00111101101000001110110000101011),
.kernel_07(32'b00111110000000111100001100101111),
.kernel_08(32'b10111110000110101010111110001110),
.pxl_out(pxl_out_78), .valid_out(valid_out_78) );

//Channel 79
conv_33 #(D, DATA_WIDTH) x79(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111110101010010101100000110000),
.kernel_01(32'b10111101110010101000011100100110),
.kernel_02(32'b00111101111000100000001111011101),
.kernel_03(32'b10111101001100110001100110100110),
.kernel_04(32'b10111100001010111101110011101111),
.kernel_05(32'b00111100110111010010100110100000),
.kernel_06(32'b10111010101000010010011000111010),
.kernel_07(32'b10111110110111001010011101100101),
.kernel_08(32'b00111101010010100010110111010100),
.pxl_out(pxl_out_79), .valid_out(valid_out_79) );

//Channel 80
conv_33 #(D, DATA_WIDTH) x80(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b00111101100010011111011111111011),
.kernel_01(32'b00111101110111101000100011111111),
.kernel_02(32'b10111100101010111100101100110010),
.kernel_03(32'b00111100110011011011001000000111),
.kernel_04(32'b00111100111001100010111001110000),
.kernel_05(32'b10111100100110010001000001000101),
.kernel_06(32'b10111110001000011101000110010111),
.kernel_07(32'b00111110101000110010000010000011),
.kernel_08(32'b10111101100101110111000110000011),
.pxl_out(pxl_out_80), .valid_out(valid_out_80) );

//Channel 81
conv_33 #(D, DATA_WIDTH) x81(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111101000011010100010011110010),
.kernel_01(32'b00111101101010000110101011101000),
.kernel_02(32'b00111100111110100001010101110011),
.kernel_03(32'b10111110010111100100011110001110),
.kernel_04(32'b00111101001100010011100000000011),
.kernel_05(32'b10111100100100100010110110000100),
.kernel_06(32'b00111011111000011000011100100111),
.kernel_07(32'b00111011110001111100010101100101),
.kernel_08(32'b10111101100100101101110010011000),
.pxl_out(pxl_out_81), .valid_out(valid_out_81) );

//Channel 82
conv_33 #(D, DATA_WIDTH) x82(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111101010111111111110011101100),
.kernel_01(32'b00111110000000000010010010101111),
.kernel_02(32'b00111101000000001010110100001101),
.kernel_03(32'b10111110000011101011011000011110),
.kernel_04(32'b10111101010100110001011111000001),
.kernel_05(32'b10111101110101111001001101010011),
.kernel_06(32'b00111011111000110100101101100110),
.kernel_07(32'b00111101011000000011110111100010),
.kernel_08(32'b00111110010001011000111000101001),
.pxl_out(pxl_out_82), .valid_out(valid_out_82) );

//Channel 83
conv_33 #(D, DATA_WIDTH) x83(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111101100110100001110101111011),
.kernel_01(32'b00111101101000010010011000010001),
.kernel_02(32'b00111011011100101110010000001001),
.kernel_03(32'b00111101100001101110100000011100),
.kernel_04(32'b10111101001000110101100011100001),
.kernel_05(32'b00111101010011101001101000011100),
.kernel_06(32'b10111100111011000000110110110010),
.kernel_07(32'b00111101010011111100100011010001),
.kernel_08(32'b10111101111000010101011001110001),
.pxl_out(pxl_out_83), .valid_out(valid_out_83) );

//Channel 84
conv_33 #(D, DATA_WIDTH) x84(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111100100111110001100000000001),
.kernel_01(32'b00111011101110111000100101100001),
.kernel_02(32'b00111110011101001011111111101011),
.kernel_03(32'b10111101010000001100011000010011),
.kernel_04(32'b00111001000100000110110100011100),
.kernel_05(32'b10111101100000110001001010111010),
.kernel_06(32'b00111101011011101011001101101100),
.kernel_07(32'b00111101111001001011110101010111),
.kernel_08(32'b00111101000001010011110101010011),
.pxl_out(pxl_out_84), .valid_out(valid_out_84) );

//Channel 85
conv_33 #(D, DATA_WIDTH) x85(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b10111100110001000111011101100000),
.kernel_01(32'b10111101011110101001101001110111),
.kernel_02(32'b10111101100100011100001111111011),
.kernel_03(32'b00111101110001100001001110100000),
.kernel_04(32'b10111101101101111101010001010110),
.kernel_05(32'b00111100100101011000100001000010),
.kernel_06(32'b10111101011110101100000011001100),
.kernel_07(32'b00111100010010111111000101101101),
.kernel_08(32'b00111101011110000101001100000111),
.pxl_out(pxl_out_85), .valid_out(valid_out_85) );

//Channel 86
conv_33 #(D, DATA_WIDTH) x86(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b00111110001001100101010111011011),
.kernel_01(32'b00111101001100100011111101101111),
.kernel_02(32'b00111100100110001100110010110111),
.kernel_03(32'b10111101110111011011111000011001),
.kernel_04(32'b00111110000001100110100010011101),
.kernel_05(32'b00111101011011001011101111011010),
.kernel_06(32'b10111101111101000001111011000001),
.kernel_07(32'b00111100101000011010011011111100),
.kernel_08(32'b10111101000000110101101110101101),
.pxl_out(pxl_out_86), .valid_out(valid_out_86) );

//Channel 87
conv_33 #(D, DATA_WIDTH) x87(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111101100001100110000100000011),
.kernel_01(32'b00111110001110110100100101011000),
.kernel_02(32'b10111101111001010110100000101101),
.kernel_03(32'b10111110010010001100001010111100),
.kernel_04(32'b10111101100101110110011100100000),
.kernel_05(32'b10111110000010101111000101100101),
.kernel_06(32'b00111110001001110010100111101011),
.kernel_07(32'b00111110001111110111010100001101),
.kernel_08(32'b00111101100011101000011000110000),
.pxl_out(pxl_out_87), .valid_out(valid_out_87) );

//Channel 88
conv_33 #(D, DATA_WIDTH) x88(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b10111101100001000111110010010111),
.kernel_01(32'b10111110000011010011010011000111),
.kernel_02(32'b10111110011100011100000011110101),
.kernel_03(32'b10111101111110100111000100101010),
.kernel_04(32'b00111101100100000011111101011000),
.kernel_05(32'b00111101101100000111000001000100),
.kernel_06(32'b00111100101111111101110100001100),
.kernel_07(32'b10111101100100101100101100011011),
.kernel_08(32'b10111101101100100001101101010000),
.pxl_out(pxl_out_88), .valid_out(valid_out_88) );

//Channel 89
conv_33 #(D, DATA_WIDTH) x89(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b10111100000011001000001011010000),
.kernel_01(32'b00111100100100111001011001001110),
.kernel_02(32'b10111100100010100101111000000000),
.kernel_03(32'b00111100010011001111001010001111),
.kernel_04(32'b00111011100001001110010110101101),
.kernel_05(32'b10111100011110000100010010111011),
.kernel_06(32'b00111110110010100010101110111011),
.kernel_07(32'b00111100000100000010101101100010),
.kernel_08(32'b10111110100110110101110111010101),
.pxl_out(pxl_out_89), .valid_out(valid_out_89) );

//Channel 90
conv_33 #(D, DATA_WIDTH) x90(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111011010001110100100100110000),
.kernel_01(32'b10111101100110111001101011001010),
.kernel_02(32'b00111101100110110011000001110011),
.kernel_03(32'b00111011111000000100000110101010),
.kernel_04(32'b00111111001011111101011110100110),
.kernel_05(32'b00111101101010110011100111101000),
.kernel_06(32'b10111110100100000101010100010111),
.kernel_07(32'b10111011100011000010000111110111),
.kernel_08(32'b00111101100000001111001001001001),
.pxl_out(pxl_out_90), .valid_out(valid_out_90) );

//Channel 91
conv_33 #(D, DATA_WIDTH) x91(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111100111100011101001001001000),
.kernel_01(32'b10111110000010101001111101101010),
.kernel_02(32'b00111101011010011111010110011101),
.kernel_03(32'b00111110100011011101001001001000),
.kernel_04(32'b10111110111000110011111100010110),
.kernel_05(32'b00111110111010000111111010011011),
.kernel_06(32'b00111101111010000000100101010001),
.kernel_07(32'b10111110100011111010000001011010),
.kernel_08(32'b00111011001001011110000001011110),
.pxl_out(pxl_out_91), .valid_out(valid_out_91) );

//Channel 92
conv_33 #(D, DATA_WIDTH) x92(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111110010111101001111110101010),
.kernel_01(32'b10111100110110100000011101110110),
.kernel_02(32'b10111101010011101110111110101100),
.kernel_03(32'b00111100100000000000001101100101),
.kernel_04(32'b10111101011010111111001101011011),
.kernel_05(32'b10111101010010000111111010011110),
.kernel_06(32'b00111110011000100110110010001100),
.kernel_07(32'b10111110111101001100010110001011),
.kernel_08(32'b10111100110111111110010110100010),
.pxl_out(pxl_out_92), .valid_out(valid_out_92) );

//Channel 93
conv_33 #(D, DATA_WIDTH) x93(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111101111011011101100101100010),
.kernel_01(32'b00111101110100001001000110111100),
.kernel_02(32'b00111110101100011001100101111011),
.kernel_03(32'b00111101111000001110000100011001),
.kernel_04(32'b10111111100001011000011010110111),
.kernel_05(32'b10111101001100111101111010011111),
.kernel_06(32'b10111100001011100110001010101011),
.kernel_07(32'b00111100011100101101111101100010),
.kernel_08(32'b00111100110010110001011100101101),
.pxl_out(pxl_out_93), .valid_out(valid_out_93) );

//Channel 94
conv_33 #(D, DATA_WIDTH) x94(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b00111101111011101010100111101010),
.kernel_01(32'b00111101100001010010000101010111),
.kernel_02(32'b10111101010000110001110100110001),
.kernel_03(32'b00111100001100011001010000111001),
.kernel_04(32'b00111110000110001111001011011010),
.kernel_05(32'b00111100000011100011100000000000),
.kernel_06(32'b00111011110110111100010001010000),
.kernel_07(32'b00111101110001110001100001111111),
.kernel_08(32'b00111111100100000000101000111011),
.pxl_out(pxl_out_94), .valid_out(valid_out_94) );

//Channel 95
conv_33 #(D, DATA_WIDTH) x95(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111100111010111000011110010011),
.kernel_01(32'b10111101101111110111111101001111),
.kernel_02(32'b10111101110101110111000010001101),
.kernel_03(32'b10111111010011000110101101100101),
.kernel_04(32'b10111101101001000000010110010101),
.kernel_05(32'b00111100000011111110111100011101),
.kernel_06(32'b10111100101001011100110101000101),
.kernel_07(32'b00111101101111101000001011100011),
.kernel_08(32'b10111101101000110101111100110001),
.pxl_out(pxl_out_95), .valid_out(valid_out_95) );

//Channel 96
conv_33 #(D, DATA_WIDTH) x96(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111110000100111110100000000110),
.kernel_01(32'b10111100100011111100110110011010),
.kernel_02(32'b10111101010010111111010000101111),
.kernel_03(32'b00111110001001011001111100011111),
.kernel_04(32'b00111110100011100000011111111011),
.kernel_05(32'b00111101100101001010111011010110),
.kernel_06(32'b10111100011001010001101111111100),
.kernel_07(32'b00111111010010110001100110100110),
.kernel_08(32'b00111101101000111111110001011010),
.pxl_out(pxl_out_96), .valid_out(valid_out_96) );

//Channel 97
conv_33 #(D, DATA_WIDTH) x97(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111111000011100100010100000111),
.kernel_01(32'b10111101001001011110110010111011),
.kernel_02(32'b00111101000111010001110110011010),
.kernel_03(32'b10111100010100111111001101100001),
.kernel_04(32'b00111011110000001010010011100101),
.kernel_05(32'b00111111000000011011000110010010),
.kernel_06(32'b10111011100000101011011100100000),
.kernel_07(32'b00111101000110010010110101011111),
.kernel_08(32'b10111100111000110011000010101100),
.pxl_out(pxl_out_97), .valid_out(valid_out_97) );

//Channel 98
conv_33 #(D, DATA_WIDTH) x98(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111100010010111000001101000101),
.kernel_01(32'b10111110000100111100011100101011),
.kernel_02(32'b00111100011110101010001100100100),
.kernel_03(32'b10111101100111010011010111011110),
.kernel_04(32'b10111111000101001001001111111110),
.kernel_05(32'b10111110101101010010000110000111),
.kernel_06(32'b00111101111001001111011001011101),
.kernel_07(32'b10111101010000101110010111011111),
.kernel_08(32'b00111110110100111100011111001001),
.pxl_out(pxl_out_98), .valid_out(valid_out_98) );

//Channel 99
conv_33 #(D, DATA_WIDTH) x99(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111100100001001010101000101001),
.kernel_01(32'b00111110000010011000000101101010),
.kernel_02(32'b00111101001101101100110010010011),
.kernel_03(32'b10111101011111001111001000101011),
.kernel_04(32'b10111100101111001101000111011000),
.kernel_05(32'b00111101111010011101100010010110),
.kernel_06(32'b00111101100010100010001100111011),
.kernel_07(32'b00111110010110000110110100101010),
.kernel_08(32'b10111110100011111101110100011110),
.pxl_out(pxl_out_99), .valid_out(valid_out_99) );

//Channel 100
conv_33 #(D, DATA_WIDTH) x100(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b10111100100100111100001101000011),
.kernel_01(32'b10111110001011000101101100001101),
.kernel_02(32'b00111101100011100000110101111010),
.kernel_03(32'b10111110110110110011001110111010),
.kernel_04(32'b00111101010100010100011010100110),
.kernel_05(32'b10111110011001010000100001100101),
.kernel_06(32'b10111110010110011110011000011010),
.kernel_07(32'b10111110001110111101010010010010),
.kernel_08(32'b00111011001100111001000010101001),
.pxl_out(pxl_out_100), .valid_out(valid_out_100) );

//Channel 101
conv_33 #(D, DATA_WIDTH) x101(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111011100101001101010001001010),
.kernel_01(32'b10111101001100100110011101111001),
.kernel_02(32'b00111101110100110001000000000011),
.kernel_03(32'b00111101000110100100111001101010),
.kernel_04(32'b00111101000111110010011100001000),
.kernel_05(32'b00111101101111000010101100100000),
.kernel_06(32'b00111110100000011001000000101100),
.kernel_07(32'b10111110000101001110010111111010),
.kernel_08(32'b10111011110011000011111000010010),
.pxl_out(pxl_out_101), .valid_out(valid_out_101) );

//Channel 102
conv_33 #(D, DATA_WIDTH) x102(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111110111000100101011001110010),
.kernel_01(32'b00111010100001100101010100100001),
.kernel_02(32'b10111100101101001001011000000110),
.kernel_03(32'b10111100101111101011100111101001),
.kernel_04(32'b00111110100000000100110010111011),
.kernel_05(32'b10111110000001011111011010110001),
.kernel_06(32'b00111100101010111110111110011110),
.kernel_07(32'b10111101011100011011000001101010),
.kernel_08(32'b00111101010000100010111011111000),
.pxl_out(pxl_out_102), .valid_out(valid_out_102) );

//Channel 103
conv_33 #(D, DATA_WIDTH) x103(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b00111100001010110110011010100000),
.kernel_01(32'b10111101100001111110110111110001),
.kernel_02(32'b00111101010111010110001100101110),
.kernel_03(32'b10111101110011111110111100000101),
.kernel_04(32'b10111100010001101111100000101000),
.kernel_05(32'b00111101011010000100110010011000),
.kernel_06(32'b00111101101000000001110111111101),
.kernel_07(32'b00111101111101010100110011010010),
.kernel_08(32'b10111110010010111001110111001000),
.pxl_out(pxl_out_103), .valid_out(valid_out_103) );

//Channel 104
conv_33 #(D, DATA_WIDTH) x104(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111100011110101001001100100111),
.kernel_01(32'b10111111001000011001001100100001),
.kernel_02(32'b00111110001111111100111010010111),
.kernel_03(32'b10111110010010001111111000111101),
.kernel_04(32'b00111100011001001111011101100111),
.kernel_05(32'b10111011111111010000101000001111),
.kernel_06(32'b10111100010001000101100011110100),
.kernel_07(32'b00111101110111100110101001110011),
.kernel_08(32'b10111010110000010000010011111010),
.pxl_out(pxl_out_104), .valid_out(valid_out_104) );

//Channel 105
conv_33 #(D, DATA_WIDTH) x105(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b00111011110111110001110100100011),
.kernel_01(32'b00111101101011100100000000000011),
.kernel_02(32'b00111110011101011010011011100000),
.kernel_03(32'b00111101101100101001001100001010),
.kernel_04(32'b00111101101110011100101000110000),
.kernel_05(32'b00111111001101101101001001010010),
.kernel_06(32'b10111101101100111001001100100010),
.kernel_07(32'b10111100111011100010100011010001),
.kernel_08(32'b00111101110010001011011100100110),
.pxl_out(pxl_out_105), .valid_out(valid_out_105) );

//Channel 106
conv_33 #(D, DATA_WIDTH) x106(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b10111111010100011101101000100100),
.kernel_01(32'b00111101001110101100001111100010),
.kernel_02(32'b00111100011000011010110011100101),
.kernel_03(32'b10111101010111111010001100100111),
.kernel_04(32'b00111101001000010000011111100111),
.kernel_05(32'b10111101001010001100101110101001),
.kernel_06(32'b10111101111100111110010000101111),
.kernel_07(32'b10111101010111000001001010000000),
.kernel_08(32'b10111011101100000010001011100110),
.pxl_out(pxl_out_106), .valid_out(valid_out_106) );

//Channel 107
conv_33 #(D, DATA_WIDTH) x107(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b00111101101000100010010001110010),
.kernel_01(32'b00111100000110101110010011001101),
.kernel_02(32'b00111110000001010100100001101110),
.kernel_03(32'b10111001111111001101001100001101),
.kernel_04(32'b00111111100000010010011110111000),
.kernel_05(32'b10111100111100010101100010001110),
.kernel_06(32'b10111110011000011000100010001100),
.kernel_07(32'b00111101100001010011000100010010),
.kernel_08(32'b10111101110011000001001110000001),
.pxl_out(pxl_out_107), .valid_out(valid_out_107) );

//Channel 108
conv_33 #(D, DATA_WIDTH) x108(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b10111100110100000011000001010100),
.kernel_01(32'b10111011010001101011011100001001),
.kernel_02(32'b10111101010010010110110100000110),
.kernel_03(32'b00111101111000000010111100011111),
.kernel_04(32'b00111110000100000010110010100001),
.kernel_05(32'b10111110000101100011010011001010),
.kernel_06(32'b00111101111010011000100100110111),
.kernel_07(32'b10111101111101011011001101101010),
.kernel_08(32'b10111110001110100100011110111001),
.pxl_out(pxl_out_108), .valid_out(valid_out_108) );

//Channel 109
conv_33 #(D, DATA_WIDTH) x109(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b10111100101001100010011000100011),
.kernel_01(32'b00111110000011011100100100111011),
.kernel_02(32'b00111101001110010111001111001111),
.kernel_03(32'b10111101000111001100110111011111),
.kernel_04(32'b00111110100110001000010010101011),
.kernel_05(32'b10111110001000101101111010010000),
.kernel_06(32'b10111101100010001010110011100100),
.kernel_07(32'b00111010101101000100100100000100),
.kernel_08(32'b10111100111111111000001010011101),
.pxl_out(pxl_out_109), .valid_out(valid_out_109) );

//Channel 110
conv_33 #(D, DATA_WIDTH) x110(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b10111110000000101000001111111100),
.kernel_01(32'b10111101000111010110110110100000),
.kernel_02(32'b10111110010000110100000000000111),
.kernel_03(32'b00111101010000011111111010011011),
.kernel_04(32'b00111101101001110101001011011011),
.kernel_05(32'b00111101101010010111101000110011),
.kernel_06(32'b00111101001000000100110101101000),
.kernel_07(32'b00111110000111001010111000001000),
.kernel_08(32'b00111110100011010010110001011000),
.pxl_out(pxl_out_110), .valid_out(valid_out_110) );

//Channel 111
conv_33 #(D, DATA_WIDTH) x111(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111110000110110110110110111110),
.kernel_01(32'b00111100100010110010111011010001),
.kernel_02(32'b00111110100110111011011111111110),
.kernel_03(32'b10111110001011010001011000101010),
.kernel_04(32'b00111101101111000111001010100101),
.kernel_05(32'b00111101011101000010001001001110),
.kernel_06(32'b10111100100001100001100111011001),
.kernel_07(32'b10111110101110001101101000111111),
.kernel_08(32'b00111101101010011001100110000001),
.pxl_out(pxl_out_111), .valid_out(valid_out_111) );

//Channel 112
conv_33 #(D, DATA_WIDTH) x112(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111101010010101101001000101001),
.kernel_01(32'b00111101100001011100100111000110),
.kernel_02(32'b10111101100010011011100010110001),
.kernel_03(32'b10111101111110001000101100111110),
.kernel_04(32'b10111101110100101110000011111110),
.kernel_05(32'b10111101001101100010010011001101),
.kernel_06(32'b10111110110000001010001001110110),
.kernel_07(32'b00111110001111001011001111111100),
.kernel_08(32'b10111110011101011000001010110000),
.pxl_out(pxl_out_112), .valid_out(valid_out_112) );

//Channel 113
conv_33 #(D, DATA_WIDTH) x113(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111101101001000010100100011100),
.kernel_01(32'b00111110001011110101110010000011),
.kernel_02(32'b00111101010010000001111100110011),
.kernel_03(32'b10111101101000110010111111111010),
.kernel_04(32'b00111101100001010101010000001001),
.kernel_05(32'b10111110010001011111000000111001),
.kernel_06(32'b00111101101010110011011101110101),
.kernel_07(32'b00111101110001110000010001110100),
.kernel_08(32'b10111100110111101101100011101010),
.pxl_out(pxl_out_113), .valid_out(valid_out_113) );

//Channel 114
conv_33 #(D, DATA_WIDTH) x114(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111101101110011110111111010001),
.kernel_01(32'b00111110011001001110110101000001),
.kernel_02(32'b00111101000011010100110111110011),
.kernel_03(32'b10111110010010101100100011100001),
.kernel_04(32'b00111101011100010001000010101101),
.kernel_05(32'b10111110001011010100101001000000),
.kernel_06(32'b10111101101000011101010011101000),
.kernel_07(32'b10111100110011110010001001001011),
.kernel_08(32'b00111101100011001111101000010111),
.pxl_out(pxl_out_114), .valid_out(valid_out_114) );

//Channel 115
conv_33 #(D, DATA_WIDTH) x115(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111100100111100010000010101011),
.kernel_01(32'b00111101000001111011111011101001),
.kernel_02(32'b10111101100011111111010001001011),
.kernel_03(32'b00111100001110110111100111100100),
.kernel_04(32'b10111101100010010011001100010101),
.kernel_05(32'b00111100001011011000010110110110),
.kernel_06(32'b10111101100100110101111110011111),
.kernel_07(32'b00111101010011010110010010100100),
.kernel_08(32'b00111101101000011110110001000010),
.pxl_out(pxl_out_115), .valid_out(valid_out_115) );

//Channel 116
conv_33 #(D, DATA_WIDTH) x116(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111100010001111011100100111010),
.kernel_01(32'b10111011101111010110111101100001),
.kernel_02(32'b10111100100001001010000000011110),
.kernel_03(32'b10111101011111010101101010000001),
.kernel_04(32'b10111101001001111110010111110101),
.kernel_05(32'b00111100101110110001001000001110),
.kernel_06(32'b10111110001101000010111101011101),
.kernel_07(32'b00111100111101001111010101001110),
.kernel_08(32'b10111011111100010000010011110001),
.pxl_out(pxl_out_116), .valid_out(valid_out_116) );

//Channel 117
conv_33 #(D, DATA_WIDTH) x117(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b10111101100111001110000111111000),
.kernel_01(32'b10111101000100100000101011110011),
.kernel_02(32'b10111101010001001000110110010011),
.kernel_03(32'b10111110000000000100010101110010),
.kernel_04(32'b00111101100111001000101110100000),
.kernel_05(32'b10111101011001100010111001000111),
.kernel_06(32'b00111101011010000110110000001010),
.kernel_07(32'b10111110000101101101100001011110),
.kernel_08(32'b00111100110011011100001010110000),
.pxl_out(pxl_out_117), .valid_out(valid_out_117) );

//Channel 118
conv_33 #(D, DATA_WIDTH) x118(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b00111100110010110101000010111110),
.kernel_01(32'b00111110010110100010100000100111),
.kernel_02(32'b00111101010011111110101100100000),
.kernel_03(32'b10111100000010110011011111110001),
.kernel_04(32'b10111010110011001111000101001000),
.kernel_05(32'b10111101110101100100001010011010),
.kernel_06(32'b00111101001000000010101001000110),
.kernel_07(32'b00111110100111011001000100010010),
.kernel_08(32'b10111101100111111110100111000001),
.pxl_out(pxl_out_118), .valid_out(valid_out_118) );

//Channel 119
conv_33 #(D, DATA_WIDTH) x119(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b00111101001111110110110101000101),
.kernel_01(32'b00111101100011001001111100000000),
.kernel_02(32'b10111101011010001100010101010111),
.kernel_03(32'b10111100110011101110100100010001),
.kernel_04(32'b10111101000010000100000101110011),
.kernel_05(32'b10111011011011100111111100001011),
.kernel_06(32'b10111100010011010111011000010100),
.kernel_07(32'b10111100101010011010100011111001),
.kernel_08(32'b10111101001011110110101111000111),
.pxl_out(pxl_out_119), .valid_out(valid_out_119) );

//Channel 120
conv_33 #(D, DATA_WIDTH) x120(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b10111101000000000110110001000111),
.kernel_01(32'b00111101000100100001010100110010),
.kernel_02(32'b10111110010101100001010100101110),
.kernel_03(32'b00111100100101100001010110001000),
.kernel_04(32'b10111101100011110011110111000001),
.kernel_05(32'b00111101101000110110110101000111),
.kernel_06(32'b10111101100000000110100000001010),
.kernel_07(32'b00111011101111000000011100011110),
.kernel_08(32'b00111101100001001011101001001001),
.pxl_out(pxl_out_120), .valid_out(valid_out_120) );

//Channel 121
conv_33 #(D, DATA_WIDTH) x121(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111101000100010111110111011000),
.kernel_01(32'b00111101000100100111000100110111),
.kernel_02(32'b10111110000011111111010100111001),
.kernel_03(32'b00111101101100000011011100001011),
.kernel_04(32'b10111101010001011100111010100010),
.kernel_05(32'b00111110010000001010101110010111),
.kernel_06(32'b00111110100000010011011011011100),
.kernel_07(32'b10111100101101111011110111110011),
.kernel_08(32'b00111100111000000100110000001000),
.pxl_out(pxl_out_121), .valid_out(valid_out_121) );

//Channel 122
conv_33 #(D, DATA_WIDTH) x122(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111000001011110101001011010111),
.kernel_01(32'b00111101101100000011100010110110),
.kernel_02(32'b10111011000101001000000010011110),
.kernel_03(32'b00111100111011011000110000011100),
.kernel_04(32'b00111101100101110001000010011000),
.kernel_05(32'b10111101010010110110001001100101),
.kernel_06(32'b10111101011010010000010010100000),
.kernel_07(32'b00111011000110110110111010011110),
.kernel_08(32'b00111011000100000101011000111000),
.pxl_out(pxl_out_122), .valid_out(valid_out_122) );

//Channel 123
conv_33 #(D, DATA_WIDTH) x123(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111100110111110010010100000010),
.kernel_01(32'b00111101110111001110011101100111),
.kernel_02(32'b00111110001100001100110001011010),
.kernel_03(32'b10111101001001110100111111101100),
.kernel_04(32'b10111101100000011011011000101011),
.kernel_05(32'b10111100101110111000011100101001),
.kernel_06(32'b10111101101101111100110011100011),
.kernel_07(32'b00111110100100101000011001100100),
.kernel_08(32'b00111101100011011101101110010101),
.pxl_out(pxl_out_123), .valid_out(valid_out_123) );

//Channel 124
conv_33 #(D, DATA_WIDTH) x124(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111100111111000101001100010001),
.kernel_01(32'b10111101100001010010001111101000),
.kernel_02(32'b10111101110100110100111010000000),
.kernel_03(32'b10111100111010101000100011010111),
.kernel_04(32'b00111100001100110000111010000011),
.kernel_05(32'b10111101000100100111011011111011),
.kernel_06(32'b10111100011010000011110011011011),
.kernel_07(32'b00111110001000011010111101111110),
.kernel_08(32'b10111100101010000010010001100110),
.pxl_out(pxl_out_124), .valid_out(valid_out_124) );

//Channel 125
conv_33 #(D, DATA_WIDTH) x125(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b10111101110111101111010110000101),
.kernel_01(32'b10111011111100111001000011111100),
.kernel_02(32'b10111110011010011010100011010000),
.kernel_03(32'b00111110000101011011011000101111),
.kernel_04(32'b00111101101000100011000110100001),
.kernel_05(32'b10111011100100110100000010001000),
.kernel_06(32'b00111110000110110111000101010011),
.kernel_07(32'b10111100111111001110101011011111),
.kernel_08(32'b10111100110110001001011000010000),
.pxl_out(pxl_out_125), .valid_out(valid_out_125) );

//Channel 126
conv_33 #(D, DATA_WIDTH) x126(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b00111101001110110111010100010111),
.kernel_01(32'b00111101001101010111010000100111),
.kernel_02(32'b10111101001100010100100110111101),
.kernel_03(32'b00111100110100100011111110100000),
.kernel_04(32'b00111011110110100001100110000001),
.kernel_05(32'b10111100101101001100010110111100),
.kernel_06(32'b00111110100100011101100010111011),
.kernel_07(32'b00111101101100000111001000100111),
.kernel_08(32'b00111101011111100001010011110010),
.pxl_out(pxl_out_126), .valid_out(valid_out_126) );

//Channel 127
conv_33 #(D, DATA_WIDTH) x127(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111101101110001101111001100101),
.kernel_01(32'b10111101001010100101011010010100),
.kernel_02(32'b10111101010100011100000110001100),
.kernel_03(32'b00111110011000101101011011101010),
.kernel_04(32'b10111010010000001010101101010100),
.kernel_05(32'b00111101100110011101100011101100),
.kernel_06(32'b10111110010011110011000010010000),
.kernel_07(32'b10111101111010010010110000100101),
.kernel_08(32'b10111100111100010100010101001111),
.pxl_out(pxl_out_127), .valid_out(valid_out_127) );

//Channel 128
conv_33 #(D, DATA_WIDTH) x128(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b00111101011000111101101011111110),
.kernel_01(32'b00111101011111101101110110100000),
.kernel_02(32'b10111100111010100111100100011010),
.kernel_03(32'b00111101111110011001011011000000),
.kernel_04(32'b10111100110111001100111101100010),
.kernel_05(32'b10111101110000000000110111110110),
.kernel_06(32'b10111101010101000010010011000100),
.kernel_07(32'b10111110011010100010010010010000),
.kernel_08(32'b00111101101001100001010011000110),
.pxl_out(pxl_out_128), .valid_out(valid_out_128) );

//Channel 129
conv_33 #(D, DATA_WIDTH) x129(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b10111101011111101100000010110010),
.kernel_01(32'b00111110000100000110011111110111),
.kernel_02(32'b00111110011001101111011000110111),
.kernel_03(32'b10111110011000101000001011001110),
.kernel_04(32'b00111101010011101011000100011010),
.kernel_05(32'b00111101110010101100010110001011),
.kernel_06(32'b10111110111100101000110000000101),
.kernel_07(32'b00111101111110011101111100100110),
.kernel_08(32'b00111101111001101100000111110110),
.pxl_out(pxl_out_129), .valid_out(valid_out_129) );

//Channel 130
conv_33 #(D, DATA_WIDTH) x130(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b00111111001001000000001010000001),
.kernel_01(32'b00111101100010000100010100011000),
.kernel_02(32'b10111100110101100011010101100001),
.kernel_03(32'b10111100100110011000100001110110),
.kernel_04(32'b00111011111100111000001110010010),
.kernel_05(32'b00111110001101000110111101000101),
.kernel_06(32'b10111011100011011111000000100000),
.kernel_07(32'b00111110100111000000001100101010),
.kernel_08(32'b00111101100000111001000000100010),
.pxl_out(pxl_out_130), .valid_out(valid_out_130) );

//Channel 131
conv_33 #(D, DATA_WIDTH) x131(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b10111110000010100011001001011100),
.kernel_01(32'b00111101010001111101010100011000),
.kernel_02(32'b10111110100011100000110010110011),
.kernel_03(32'b10111101001111011001110010001010),
.kernel_04(32'b10111110001010010100101011100001),
.kernel_05(32'b10111101101001011010010011100001),
.kernel_06(32'b10111010011110001011001000111100),
.kernel_07(32'b10111101110110000110001010101001),
.kernel_08(32'b00111110000101000000101101000101),
.pxl_out(pxl_out_131), .valid_out(valid_out_131) );

//Channel 132
conv_33 #(D, DATA_WIDTH) x132(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b10111110101010001011011010101011),
.kernel_01(32'b00111111001111011110001000101010),
.kernel_02(32'b10111101111000000010010000000000),
.kernel_03(32'b10111110011101110100110000111101),
.kernel_04(32'b00111100111000101011110100111010),
.kernel_05(32'b00111101101001000100011010101000),
.kernel_06(32'b00111111000001100010100111101000),
.kernel_07(32'b10111111001010011010010100110100),
.kernel_08(32'b10111110000010101110101000101111),
.pxl_out(pxl_out_132), .valid_out(valid_out_132) );

//Channel 133
conv_33 #(D, DATA_WIDTH) x133(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b10111011110101111011110001101111),
.kernel_01(32'b10111110010101010110001101110101),
.kernel_02(32'b10111110001001110010101000100011),
.kernel_03(32'b10111101001101001110010110100111),
.kernel_04(32'b00111101111011100010111001100111),
.kernel_05(32'b10111101011011011110111011001011),
.kernel_06(32'b00111110100011101010000100001101),
.kernel_07(32'b10111110001010010001110001000101),
.kernel_08(32'b10111101101000010100000011110010),
.pxl_out(pxl_out_133), .valid_out(valid_out_133) );

//Channel 134
conv_33 #(D, DATA_WIDTH) x134(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b10111100110001110111100101010011),
.kernel_01(32'b10111110101001000111101111001000),
.kernel_02(32'b10111100000100111010111111000110),
.kernel_03(32'b00111110101000001011010100111000),
.kernel_04(32'b10111110101101110111110101010010),
.kernel_05(32'b00111101110111011100000101100010),
.kernel_06(32'b10111100101000110101000100000110),
.kernel_07(32'b10111110000010101100001100000000),
.kernel_08(32'b10111101101110001101111101101101),
.pxl_out(pxl_out_134), .valid_out(valid_out_134) );

//Channel 135
conv_33 #(D, DATA_WIDTH) x135(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111110000011010101100100010000),
.kernel_01(32'b10111110100100011101001010000010),
.kernel_02(32'b00111110001010100001111010110001),
.kernel_03(32'b10111101000000001111100010001110),
.kernel_04(32'b10111110001001110001001011110101),
.kernel_05(32'b10111101011100101110010011101111),
.kernel_06(32'b00111110000011001111100011110011),
.kernel_07(32'b10111110001001101010100011111011),
.kernel_08(32'b00111111000110111101100100110101),
.pxl_out(pxl_out_135), .valid_out(valid_out_135) );

//Channel 136
conv_33 #(D, DATA_WIDTH) x136(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111010101100101111111101111101),
.kernel_01(32'b00111101000001010101001101110001),
.kernel_02(32'b00111101010111010011011011010000),
.kernel_03(32'b10111101111010000110100011000110),
.kernel_04(32'b10111101000111101011100111010100),
.kernel_05(32'b10111101110011001011001111100011),
.kernel_06(32'b10111101000100111011011010011000),
.kernel_07(32'b10111101011100011001001001101000),
.kernel_08(32'b10111011100000100110110001001000),
.pxl_out(pxl_out_136), .valid_out(valid_out_136) );

//Channel 137
conv_33 #(D, DATA_WIDTH) x137(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111101100100110011010011100100),
.kernel_01(32'b00111100011000110111011010010111),
.kernel_02(32'b10111100100111000010000000010100),
.kernel_03(32'b00111110001111000101000100011101),
.kernel_04(32'b10111101011100001111000011101001),
.kernel_05(32'b10111110000110100101111110101101),
.kernel_06(32'b10111110000010010110101110100110),
.kernel_07(32'b00111101001101000110001111110010),
.kernel_08(32'b10111101111010110110100100111100),
.pxl_out(pxl_out_137), .valid_out(valid_out_137) );

//Channel 138
conv_33 #(D, DATA_WIDTH) x138(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111110100100111110001001011100),
.kernel_01(32'b10111101010010000111101101110100),
.kernel_02(32'b10111101111010000100111011111011),
.kernel_03(32'b10111101100100100100000111101001),
.kernel_04(32'b10111100101111100111101011000110),
.kernel_05(32'b00111100111101000000101001110011),
.kernel_06(32'b00111101001110000010101101010111),
.kernel_07(32'b10111101010100001100101111101000),
.kernel_08(32'b00111101011110101010101100011010),
.pxl_out(pxl_out_138), .valid_out(valid_out_138) );

//Channel 139
conv_33 #(D, DATA_WIDTH) x139(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111101100110000111001110101110),
.kernel_01(32'b10111101000110001011011111010110),
.kernel_02(32'b10111110000111010110011001111111),
.kernel_03(32'b10111101011101111110111000001101),
.kernel_04(32'b10111101101011100000000100101111),
.kernel_05(32'b00111100000111110011010000110001),
.kernel_06(32'b00111101100010101110010001111101),
.kernel_07(32'b00111101111010001001101110000000),
.kernel_08(32'b00111101000101011011110101111110),
.pxl_out(pxl_out_139), .valid_out(valid_out_139) );

//Channel 140
conv_33 #(D, DATA_WIDTH) x140(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111101000100000110111011010010),
.kernel_01(32'b00111101101101000001001011001010),
.kernel_02(32'b10111100001101010011111000010100),
.kernel_03(32'b10111101000010011110001010000110),
.kernel_04(32'b00111100110011110110100000001111),
.kernel_05(32'b00111101001001101011111110100111),
.kernel_06(32'b00111100110101111001100101111110),
.kernel_07(32'b00111101011111011111100011011001),
.kernel_08(32'b00111110011000100000111011100010),
.pxl_out(pxl_out_140), .valid_out(valid_out_140) );

//Channel 141
conv_33 #(D, DATA_WIDTH) x141(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111101101010000100010111010110),
.kernel_01(32'b00111101100001001111100110001111),
.kernel_02(32'b10111110000000000111110100101010),
.kernel_03(32'b10111101000110100110100110110111),
.kernel_04(32'b00111110000000001100001010100000),
.kernel_05(32'b10111100111110111000110000001001),
.kernel_06(32'b00111101101111111010000001110001),
.kernel_07(32'b00111101001101011001001001011111),
.kernel_08(32'b10111101110101110110001010111000),
.pxl_out(pxl_out_141), .valid_out(valid_out_141) );

//Channel 142
conv_33 #(D, DATA_WIDTH) x142(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111011100101110000010111100111),
.kernel_01(32'b10111100100000110011010111001001),
.kernel_02(32'b10111110000111111010010011011001),
.kernel_03(32'b00111010111111001111001101011010),
.kernel_04(32'b00111101101001010010100101000001),
.kernel_05(32'b10111101011000011011101100010010),
.kernel_06(32'b00111101011010100000101011101101),
.kernel_07(32'b00111011101011011010001110111010),
.kernel_08(32'b00111101000101101010101110011100),
.pxl_out(pxl_out_142), .valid_out(valid_out_142) );

//Channel 143
conv_33 #(D, DATA_WIDTH) x143(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b10111110010110000001010101011111),
.kernel_01(32'b00111100110011011100101110010100),
.kernel_02(32'b10111101000000100001110101100111),
.kernel_03(32'b10111100100110110100110110010100),
.kernel_04(32'b00111100001110101110010010111111),
.kernel_05(32'b00111101011001100010110000100111),
.kernel_06(32'b00111110111000010001111111010001),
.kernel_07(32'b10111110000000111010110000100001),
.kernel_08(32'b10111011111110100011000110110011),
.pxl_out(pxl_out_143), .valid_out(valid_out_143) );

//Channel 144
conv_33 #(D, DATA_WIDTH) x144(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b00111101101001001100101010000111),
.kernel_01(32'b10111101100011000011101001111001),
.kernel_02(32'b00111101011100111101011100001000),
.kernel_03(32'b10111101111011110101100001111100),
.kernel_04(32'b10111101011100100101111011110001),
.kernel_05(32'b00111101001011101010010111001010),
.kernel_06(32'b00111011001101100101110000110101),
.kernel_07(32'b00111110010000111000001010001100),
.kernel_08(32'b00111101101011011010000110001000),
.pxl_out(pxl_out_144), .valid_out(valid_out_144) );

//Channel 145
conv_33 #(D, DATA_WIDTH) x145(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b00111100011000001000000011010100),
.kernel_01(32'b10111101111100111011010100010100),
.kernel_02(32'b00111101001000100001011000100011),
.kernel_03(32'b10111101001110001100101100100111),
.kernel_04(32'b00111101001100111110101010100100),
.kernel_05(32'b10111100000100001001101011011011),
.kernel_06(32'b10111101001011101110001010000100),
.kernel_07(32'b00111101111110001110010100010110),
.kernel_08(32'b10111100110110001001010111100101),
.pxl_out(pxl_out_145), .valid_out(valid_out_145) );

//Channel 146
conv_33 #(D, DATA_WIDTH) x146(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b00111100111011100100110000010101),
.kernel_01(32'b10111101110011110111111001010010),
.kernel_02(32'b00111100110001100000011111010110),
.kernel_03(32'b00111110000100100000111101000001),
.kernel_04(32'b00111110010000101101011010010101),
.kernel_05(32'b00111110001011000001100111010100),
.kernel_06(32'b00111100000100111110000111111011),
.kernel_07(32'b10111011011110010000100100111011),
.kernel_08(32'b00111110000100110111011110001011),
.pxl_out(pxl_out_146), .valid_out(valid_out_146) );

//Channel 147
conv_33 #(D, DATA_WIDTH) x147(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111100100110000101001001111110),
.kernel_01(32'b00111101011000000001001110001111),
.kernel_02(32'b10111101000101010010000110001101),
.kernel_03(32'b10111101000111111111000110011010),
.kernel_04(32'b00111011100010011011110010111011),
.kernel_05(32'b10111101011010011001110011111110),
.kernel_06(32'b00111110011110000001110001010011),
.kernel_07(32'b10111101000111010000010101000101),
.kernel_08(32'b00111110011001100001000000110010),
.pxl_out(pxl_out_147), .valid_out(valid_out_147) );

//Channel 148
conv_33 #(D, DATA_WIDTH) x148(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111110000001011000111001001011),
.kernel_01(32'b10111101100001001110000111011110),
.kernel_02(32'b00111101011101000000010001101110),
.kernel_03(32'b10111101101001000000010101011101),
.kernel_04(32'b10111100101100011111100111000100),
.kernel_05(32'b10111100100000001000001100001101),
.kernel_06(32'b10111110110110001011011100011011),
.kernel_07(32'b00111110010101010100101101000000),
.kernel_08(32'b10111100111000100101111100111100),
.pxl_out(pxl_out_148), .valid_out(valid_out_148) );

//Channel 149
conv_33 #(D, DATA_WIDTH) x149(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b10111110000110001100011011011000),
.kernel_01(32'b00111101011011100000101001111111),
.kernel_02(32'b10111101110001101001000100011101),
.kernel_03(32'b10111111001000111101000111100000),
.kernel_04(32'b00111110101000010100100000111010),
.kernel_05(32'b00111101101001010110010001100010),
.kernel_06(32'b00111101101110000001010110111111),
.kernel_07(32'b10111100100011010010001110100101),
.kernel_08(32'b00111100111001111001101100101000),
.pxl_out(pxl_out_149), .valid_out(valid_out_149) );

//Channel 150
conv_33 #(D, DATA_WIDTH) x150(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111110000001000100111000110110),
.kernel_01(32'b00111101111111011110000010001011),
.kernel_02(32'b10111101011000101100010001111011),
.kernel_03(32'b00111100110001010111001101100100),
.kernel_04(32'b10111100110011010000100111110000),
.kernel_05(32'b00111110000010000110011111110111),
.kernel_06(32'b00111100100000100001001000111100),
.kernel_07(32'b00111100000001110101100100011100),
.kernel_08(32'b10111100001101000000110100110110),
.pxl_out(pxl_out_150), .valid_out(valid_out_150) );

//Channel 151
conv_33 #(D, DATA_WIDTH) x151(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111110010000110000100000100101),
.kernel_01(32'b00111100001101101111001010101111),
.kernel_02(32'b00111011001010010011100010110111),
.kernel_03(32'b00111101101110001100100010100010),
.kernel_04(32'b00111101011101110000001010100001),
.kernel_05(32'b00111110000100100001100011100001),
.kernel_06(32'b00111011101110110110111011100011),
.kernel_07(32'b10111101100000101101010011110010),
.kernel_08(32'b00111100111101000000010000110011),
.pxl_out(pxl_out_151), .valid_out(valid_out_151) );

//Channel 152
conv_33 #(D, DATA_WIDTH) x152(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111100110110101101110000001010),
.kernel_01(32'b00111101110100101110000110011110),
.kernel_02(32'b00111110101011101110110001100011),
.kernel_03(32'b00111101000100111110110010010110),
.kernel_04(32'b00111101101001001111010010001101),
.kernel_05(32'b10111101101010000010110011010000),
.kernel_06(32'b10111100111101000010101011010011),
.kernel_07(32'b10111101100110000011000101011000),
.kernel_08(32'b00111101101111100010100001010101),
.pxl_out(pxl_out_152), .valid_out(valid_out_152) );

//Channel 153
conv_33 #(D, DATA_WIDTH) x153(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b10111101010110011011010101101100),
.kernel_01(32'b00111101000110100100101100100010),
.kernel_02(32'b00111110000101001000011110111000),
.kernel_03(32'b10111110000010101001000101010100),
.kernel_04(32'b00111110010101110100011011011010),
.kernel_05(32'b00111101001110111010111000110001),
.kernel_06(32'b10111110010111000010011100010100),
.kernel_07(32'b10111101101010101100001100101001),
.kernel_08(32'b10111100101101001001011101100000),
.pxl_out(pxl_out_153), .valid_out(valid_out_153) );

//Channel 154
conv_33 #(D, DATA_WIDTH) x154(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111101110111100011000010100000),
.kernel_01(32'b10111110001100011000110011101000),
.kernel_02(32'b00111101110111101100011101110011),
.kernel_03(32'b10111011101001000101010111111011),
.kernel_04(32'b10111111000011110111000000111011),
.kernel_05(32'b00111101000010111100101001110100),
.kernel_06(32'b10111001100000110011011110111001),
.kernel_07(32'b10111101100010001011011010010011),
.kernel_08(32'b10111101100101011111100110101010),
.pxl_out(pxl_out_154), .valid_out(valid_out_154) );

//Channel 155
conv_33 #(D, DATA_WIDTH) x155(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b10111110010101100111110111111101),
.kernel_01(32'b10111110100000000000101011010001),
.kernel_02(32'b00111101000001101111100000100110),
.kernel_03(32'b00111101000001100001001000011000),
.kernel_04(32'b10111110101001000100100100111001),
.kernel_05(32'b00111110000101101001000111010010),
.kernel_06(32'b10111100100101101011000100110001),
.kernel_07(32'b10111101100011001101111101000111),
.kernel_08(32'b10111101010110001010100011101010),
.pxl_out(pxl_out_155), .valid_out(valid_out_155) );

//Channel 156
conv_33 #(D, DATA_WIDTH) x156(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111100111110110001001000001110),
.kernel_01(32'b00111101101110111111000011100001),
.kernel_02(32'b10111101101001000101010111100010),
.kernel_03(32'b10111100010000110110101101110100),
.kernel_04(32'b00111101010001110101100111010011),
.kernel_05(32'b00111101000111000110111001110011),
.kernel_06(32'b10111110101001101001111100101001),
.kernel_07(32'b00111111011111000000110001001010),
.kernel_08(32'b00111101000101000000011101011010),
.pxl_out(pxl_out_156), .valid_out(valid_out_156) );

//Channel 157
conv_33 #(D, DATA_WIDTH) x157(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111110011011000011001001010001),
.kernel_01(32'b10111101101001101000000000000000),
.kernel_02(32'b00111110000011001011111111010101),
.kernel_03(32'b10111111000101011000001101011110),
.kernel_04(32'b10111101110100000011110011111001),
.kernel_05(32'b00111100110001000001100100111000),
.kernel_06(32'b10111100111010001000010010001010),
.kernel_07(32'b10111100101010101011111000100001),
.kernel_08(32'b10111100001101001100111110110010),
.pxl_out(pxl_out_157), .valid_out(valid_out_157) );

//Channel 158
conv_33 #(D, DATA_WIDTH) x158(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b00111101111010001101110010011001),
.kernel_01(32'b10111110000011011111100111011001),
.kernel_02(32'b00111101001110000001101010101101),
.kernel_03(32'b00111101010001100110010110101011),
.kernel_04(32'b00111101100000000111110000000110),
.kernel_05(32'b10111101101100000010101010011100),
.kernel_06(32'b10111101001011101101010100000010),
.kernel_07(32'b10111101110000111111110011111100),
.kernel_08(32'b10111110001001110011001000111101),
.pxl_out(pxl_out_158), .valid_out(valid_out_158) );

//Channel 159
conv_33 #(D, DATA_WIDTH) x159(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111101101110011000100011101010),
.kernel_01(32'b10111100100100110011010010101011),
.kernel_02(32'b00111101101011110000101100111100),
.kernel_03(32'b10111100001001001011100101000001),
.kernel_04(32'b10111101101100001011010101010010),
.kernel_05(32'b00111101000010111110010011001000),
.kernel_06(32'b10111101101000010110010001101000),
.kernel_07(32'b10111101110110111000001110001110),
.kernel_08(32'b10111101111100000100001110010010),
.pxl_out(pxl_out_159), .valid_out(valid_out_159) );

//Channel 160
conv_33 #(D, DATA_WIDTH) x160(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b00111011111110111011100101111110),
.kernel_01(32'b10111101100101000000010101111011),
.kernel_02(32'b00111101100110101001101001101000),
.kernel_03(32'b00111101110110010000100000111000),
.kernel_04(32'b10111101011000000000000111110011),
.kernel_05(32'b00111110001011011011001000100110),
.kernel_06(32'b00111101100011011110000100110000),
.kernel_07(32'b10111110000101010001110100100000),
.kernel_08(32'b00111100011011000000110000110110),
.pxl_out(pxl_out_160), .valid_out(valid_out_160) );

//Channel 161
conv_33 #(D, DATA_WIDTH) x161(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111100111000100001010101111010),
.kernel_01(32'b10111100101011010011100011001110),
.kernel_02(32'b00111110101011111010101101000110),
.kernel_03(32'b10111101100001001110100000010010),
.kernel_04(32'b00111101001000111100011001000001),
.kernel_05(32'b10111010100000110111000001000100),
.kernel_06(32'b00111100100000100111101100001000),
.kernel_07(32'b00111101100010010001001100010101),
.kernel_08(32'b10111110010000110010110011000111),
.pxl_out(pxl_out_161), .valid_out(valid_out_161) );

//Channel 162
conv_33 #(D, DATA_WIDTH) x162(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b00111110001000011111010001101111),
.kernel_01(32'b10111110101001011011011101011010),
.kernel_02(32'b00111100000001001101111101110000),
.kernel_03(32'b10111101101001000101010110000111),
.kernel_04(32'b10111101110011001000110111100000),
.kernel_05(32'b00111101000100110101101001111111),
.kernel_06(32'b00111100100100000111110111011110),
.kernel_07(32'b10111110011011011100101010010000),
.kernel_08(32'b00111101100000001001001010100111),
.pxl_out(pxl_out_162), .valid_out(valid_out_162) );

//Channel 163
conv_33 #(D, DATA_WIDTH) x163(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b10111011111100011111010010101010),
.kernel_01(32'b10111101000011001101100111001011),
.kernel_02(32'b00111110000110111001000001100011),
.kernel_03(32'b10111100010000100010000100101111),
.kernel_04(32'b00111110001010010000011100110111),
.kernel_05(32'b00111110110111101101110000010111),
.kernel_06(32'b10111110101000110100000010001001),
.kernel_07(32'b00111101110111100100111101101111),
.kernel_08(32'b10111101100111111000001100111000),
.pxl_out(pxl_out_163), .valid_out(valid_out_163) );

//Channel 164
conv_33 #(D, DATA_WIDTH) x164(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111100100011000110010010011101),
.kernel_01(32'b10111101011001101011101111111011),
.kernel_02(32'b00111101000110111110001111011010),
.kernel_03(32'b10111110101010111110110100000111),
.kernel_04(32'b00111101111011110001111100110010),
.kernel_05(32'b00111011000101000110010101001101),
.kernel_06(32'b00111100011010101101000111010000),
.kernel_07(32'b00111101111110101111000010101010),
.kernel_08(32'b00111101110100001100011001001001),
.pxl_out(pxl_out_164), .valid_out(valid_out_164) );

//Channel 165
conv_33 #(D, DATA_WIDTH) x165(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111110111010100110101100010000),
.kernel_01(32'b00111100110001100100101001101111),
.kernel_02(32'b10111101000111010000101110111101),
.kernel_03(32'b00111011001001101010100110101100),
.kernel_04(32'b10111100111101010000010000000101),
.kernel_05(32'b10111011100001111010000110000000),
.kernel_06(32'b10111110001110101111111011010010),
.kernel_07(32'b10111011100100100000011010110011),
.kernel_08(32'b10111011110001100100101010001101),
.pxl_out(pxl_out_165), .valid_out(valid_out_165) );

//Channel 166
conv_33 #(D, DATA_WIDTH) x166(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b10111100001001111011110010110000),
.kernel_01(32'b00111101011100100011100001010000),
.kernel_02(32'b10111011010000110010110010100111),
.kernel_03(32'b10111101110001101000011000100000),
.kernel_04(32'b10111110000100001010110001101111),
.kernel_05(32'b00111100010111000100011010101001),
.kernel_06(32'b00111101001111011000110110110100),
.kernel_07(32'b00111011100011110001000101011001),
.kernel_08(32'b10111101001100100110110000001111),
.pxl_out(pxl_out_166), .valid_out(valid_out_166) );

//Channel 167
conv_33 #(D, DATA_WIDTH) x167(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b00111100110001101001101010101011),
.kernel_01(32'b00111110101100100000010100010011),
.kernel_02(32'b10111010101010111001101101011110),
.kernel_03(32'b00111010101110101000110110101011),
.kernel_04(32'b10111100000100111110010000101011),
.kernel_05(32'b00111110000101101011101001000000),
.kernel_06(32'b00111101001000110111111011110110),
.kernel_07(32'b00111110001001111111111100111110),
.kernel_08(32'b00111110001100001011001101111101),
.pxl_out(pxl_out_167), .valid_out(valid_out_167) );

//Channel 168
conv_33 #(D, DATA_WIDTH) x168(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111101100011100011001001010101),
.kernel_01(32'b00111100100001000011010001011010),
.kernel_02(32'b10111100110101111000111101111110),
.kernel_03(32'b00111101011001000000100001111000),
.kernel_04(32'b10111101100000110001000001011010),
.kernel_05(32'b10111100101010110011110010101100),
.kernel_06(32'b00111101110110011000110111110010),
.kernel_07(32'b00111011010110000111010111001011),
.kernel_08(32'b10111101000110001110111110010001),
.pxl_out(pxl_out_168), .valid_out(valid_out_168) );

//Channel 169
conv_33 #(D, DATA_WIDTH) x169(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b00111101000110011000110101111100),
.kernel_01(32'b00111100100000011010100011001001),
.kernel_02(32'b00111110000000110010000110101001),
.kernel_03(32'b10111101101001110011000110111010),
.kernel_04(32'b00111101001110011111011111101001),
.kernel_05(32'b00111101001000110001110011101001),
.kernel_06(32'b10111101011111000011101011001001),
.kernel_07(32'b00111100100111001000000011110100),
.kernel_08(32'b10111101111100100000010100000011),
.pxl_out(pxl_out_169), .valid_out(valid_out_169) );

//Channel 170
conv_33 #(D, DATA_WIDTH) x170(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111110101001110010101100111000),
.kernel_01(32'b10111100111001110010000011010111),
.kernel_02(32'b00111100110011001001011111000111),
.kernel_03(32'b00111100101111100000111000111101),
.kernel_04(32'b00111100111101111101011110111100),
.kernel_05(32'b10111100010011000010011110010110),
.kernel_06(32'b10111110000010111010000001010010),
.kernel_07(32'b00111101100111011010011000011000),
.kernel_08(32'b10111101111111101010101010011001),
.pxl_out(pxl_out_170), .valid_out(valid_out_170) );

//Channel 171
conv_33 #(D, DATA_WIDTH) x171(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b00111110001110000110100011100111),
.kernel_01(32'b10111011100110001111101101101000),
.kernel_02(32'b10111110010101101001001101001010),
.kernel_03(32'b10111110000000000111000011011000),
.kernel_04(32'b10111110110000110110011101010011),
.kernel_05(32'b00111110000010010100110111100101),
.kernel_06(32'b00111101001010110011011111001000),
.kernel_07(32'b10111100011100001110110011110111),
.kernel_08(32'b10111110000111000101010010000000),
.pxl_out(pxl_out_171), .valid_out(valid_out_171) );

//Channel 172
conv_33 #(D, DATA_WIDTH) x172(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111101100111111101010001001011),
.kernel_01(32'b10111101001011011000101000100110),
.kernel_02(32'b10111111001001011010001001111110),
.kernel_03(32'b00111101011110100100110011101110),
.kernel_04(32'b00111011111111001011110000111011),
.kernel_05(32'b00111101000100100101110000111001),
.kernel_06(32'b10111100110110000101100011100001),
.kernel_07(32'b10111101111110010100001111111111),
.kernel_08(32'b10111101101111101010000000011010),
.pxl_out(pxl_out_172), .valid_out(valid_out_172) );

//Channel 173
conv_33 #(D, DATA_WIDTH) x173(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111101011011011000111100101011),
.kernel_01(32'b00111100000101100010101100010011),
.kernel_02(32'b10111101110011011101101010010001),
.kernel_03(32'b00111110011100101111010111101101),
.kernel_04(32'b00111110000100011001100110001110),
.kernel_05(32'b10111011001100010110111001011111),
.kernel_06(32'b10111101000001000000110101110010),
.kernel_07(32'b10111101101111001011011111101110),
.kernel_08(32'b00111101001110100011101010010000),
.pxl_out(pxl_out_173), .valid_out(valid_out_173) );

//Channel 174
conv_33 #(D, DATA_WIDTH) x174(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b10111101101110110101000010000000),
.kernel_01(32'b10111101000000010010100010010110),
.kernel_02(32'b10111101000111100100111110001010),
.kernel_03(32'b10111011110111001100100010110011),
.kernel_04(32'b10111110110010100111110000111101),
.kernel_05(32'b00111111001000111101110001000011),
.kernel_06(32'b00111100000101100000101001101111),
.kernel_07(32'b00111110100000110010100000100110),
.kernel_08(32'b10111101111011100100101101100100),
.pxl_out(pxl_out_174), .valid_out(valid_out_174) );

//Channel 175
conv_33 #(D, DATA_WIDTH) x175(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111101010101010101000101000000),
.kernel_01(32'b00111110001010000100001001010100),
.kernel_02(32'b10111101110110110101000011100110),
.kernel_03(32'b10111110011111001000110000000010),
.kernel_04(32'b00111100110110100100111110110100),
.kernel_05(32'b10111110001111010010101011111111),
.kernel_06(32'b00111011111011010111100111010101),
.kernel_07(32'b00111101110100000011001110001011),
.kernel_08(32'b00111110000111000101001011000100),
.pxl_out(pxl_out_175), .valid_out(valid_out_175) );

//Channel 176
conv_33 #(D, DATA_WIDTH) x176(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111100101100111011001011110010),
.kernel_01(32'b00111101111011000111000100100111),
.kernel_02(32'b00111101111111100010110111011001),
.kernel_03(32'b00111110000100010000000010010000),
.kernel_04(32'b10111110010010010000110101100111),
.kernel_05(32'b00111101110110000000100111110010),
.kernel_06(32'b10111110010101000100100001011010),
.kernel_07(32'b00111101101000100101101100111110),
.kernel_08(32'b00111100011011000010111101110101),
.pxl_out(pxl_out_176), .valid_out(valid_out_176) );

//Channel 177
conv_33 #(D, DATA_WIDTH) x177(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111101111011100110111101000011),
.kernel_01(32'b00111101101010010110001110001111),
.kernel_02(32'b00111101100110011111011101010101),
.kernel_03(32'b10111100110010010001011110010000),
.kernel_04(32'b10111101110100010011001010100011),
.kernel_05(32'b10111110100110100000000000100000),
.kernel_06(32'b00111101111001101000100110111000),
.kernel_07(32'b10111101100010100111000100011011),
.kernel_08(32'b00111011110110000110100010111000),
.pxl_out(pxl_out_177), .valid_out(valid_out_177) );

//Channel 178
conv_33 #(D, DATA_WIDTH) x178(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111100100101000001110001101001),
.kernel_01(32'b00111100111010110001001101011111),
.kernel_02(32'b10111101101000100100100011011111),
.kernel_03(32'b10111110001110000111000011000111),
.kernel_04(32'b10111101000011111000111010101000),
.kernel_05(32'b00111011111011110101000001000111),
.kernel_06(32'b00111101000100101111100000011101),
.kernel_07(32'b00111101000111011101111010111101),
.kernel_08(32'b10111101100000101000001100010000),
.pxl_out(pxl_out_178), .valid_out(valid_out_178) );

//Channel 179
conv_33 #(D, DATA_WIDTH) x179(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111101101001000001011011001000),
.kernel_01(32'b10111100100010101001110010001111),
.kernel_02(32'b10111101100100011011010111001011),
.kernel_03(32'b00111110000110010001111001101101),
.kernel_04(32'b00111100110010101001001111100101),
.kernel_05(32'b00111100101111011001111011100100),
.kernel_06(32'b10111100100111010101100011000001),
.kernel_07(32'b00111100101100010100100001001100),
.kernel_08(32'b00111101101110100100100001001101),
.pxl_out(pxl_out_179), .valid_out(valid_out_179) );

//Channel 180
conv_33 #(D, DATA_WIDTH) x180(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111101111110101011111000000000),
.kernel_01(32'b00111101010100001101110010110100),
.kernel_02(32'b00111101000000011101101011100101),
.kernel_03(32'b10111111000011001111011000000001),
.kernel_04(32'b10111101100010001111111010010010),
.kernel_05(32'b10111110001101101101000001110111),
.kernel_06(32'b00111110101110101110101100001001),
.kernel_07(32'b10111100100101010100100011001111),
.kernel_08(32'b00111101101101010000110111000101),
.pxl_out(pxl_out_180), .valid_out(valid_out_180) );

//Channel 181
conv_33 #(D, DATA_WIDTH) x181(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111101001100011100010010000111),
.kernel_01(32'b00111101010000100001110100110110),
.kernel_02(32'b10111011010101111101101100001110),
.kernel_03(32'b00111101010110010111100011100001),
.kernel_04(32'b00111100101110011000001001111000),
.kernel_05(32'b10111101010100011110100110010011),
.kernel_06(32'b00111111001011000100101010001000),
.kernel_07(32'b00111100110111110101001000001000),
.kernel_08(32'b10111110001101001110001101010000),
.pxl_out(pxl_out_181), .valid_out(valid_out_181) );

//Channel 182
conv_33 #(D, DATA_WIDTH) x182(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111110011000110011001011110011),
.kernel_01(32'b10111110101111110100001100101101),
.kernel_02(32'b00111110010111110011010101100011),
.kernel_03(32'b00111100000110110111100110101110),
.kernel_04(32'b00111101100011000110001110101101),
.kernel_05(32'b00111100011100111110011111011100),
.kernel_06(32'b00111101010010001101101101001101),
.kernel_07(32'b00111110000000011111010111110110),
.kernel_08(32'b10111101100011001110010100011111),
.pxl_out(pxl_out_182), .valid_out(valid_out_182) );

//Channel 183
conv_33 #(D, DATA_WIDTH) x183(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111100100111010110111000011000),
.kernel_01(32'b00111101011010100000010111100111),
.kernel_02(32'b10111110001010101011000010101100),
.kernel_03(32'b00111100001010001000000111100001),
.kernel_04(32'b10111110001101011100001101110100),
.kernel_05(32'b00111101100010010010110011000100),
.kernel_06(32'b00111100111001111000100110110101),
.kernel_07(32'b10111100100011001101000100010101),
.kernel_08(32'b10111101101011111001110011011110),
.pxl_out(pxl_out_183), .valid_out(valid_out_183) );

//Channel 184
conv_33 #(D, DATA_WIDTH) x184(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111110001010101011101110110000),
.kernel_01(32'b00111101101100010000000010000001),
.kernel_02(32'b10111110010101101111010010111111),
.kernel_03(32'b00111101100100001001010011011000),
.kernel_04(32'b00111101100010111011111000100111),
.kernel_05(32'b10111101100100000101011101000010),
.kernel_06(32'b10111101001010110011110100110110),
.kernel_07(32'b10111100110110111111011110111100),
.kernel_08(32'b00111110000101101111000111101011),
.pxl_out(pxl_out_184), .valid_out(valid_out_184) );

//Channel 185
conv_33 #(D, DATA_WIDTH) x185(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111100011111100000110101010000),
.kernel_01(32'b00111100101100110111001011111100),
.kernel_02(32'b10111110000111010010111011111010),
.kernel_03(32'b00111101000111100001100001110101),
.kernel_04(32'b00111101110100111000011101010101),
.kernel_05(32'b00111110000111101010001100110111),
.kernel_06(32'b00111110101000111100011000010000),
.kernel_07(32'b00111100100111001100101110100010),
.kernel_08(32'b10111100011011000011111111111010),
.pxl_out(pxl_out_185), .valid_out(valid_out_185) );

//Channel 186
conv_33 #(D, DATA_WIDTH) x186(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111011100100111110011000001111),
.kernel_01(32'b10111101001000101001101111111001),
.kernel_02(32'b00111101001000000111101011000100),
.kernel_03(32'b00111110010000001101101100011010),
.kernel_04(32'b00111100110011001010111000100100),
.kernel_05(32'b10111100101011011100001101100110),
.kernel_06(32'b10111101110000111000011001010101),
.kernel_07(32'b10111100111110010010000001000011),
.kernel_08(32'b00111100110100001110000110111111),
.pxl_out(pxl_out_186), .valid_out(valid_out_186) );

//Channel 187
conv_33 #(D, DATA_WIDTH) x187(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b10111100110010110011001011010010),
.kernel_01(32'b00111100011100000001001010000010),
.kernel_02(32'b00111100100011100111110000100101),
.kernel_03(32'b10111100110110100110110010111001),
.kernel_04(32'b10111110011111101110101000011100),
.kernel_05(32'b00111101001101000000111101100000),
.kernel_06(32'b00111101110101001100100000010010),
.kernel_07(32'b10111110000010011011011010100111),
.kernel_08(32'b10111100010111101101000111001100),
.pxl_out(pxl_out_187), .valid_out(valid_out_187) );

//Channel 188
conv_33 #(D, DATA_WIDTH) x188(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111101010001101101100110011000),
.kernel_01(32'b10111101001000001011111101110010),
.kernel_02(32'b10111101000011111101100001101011),
.kernel_03(32'b10111101010111100100101101100111),
.kernel_04(32'b00111100110100000110100010111100),
.kernel_05(32'b00111100110110100110011010011110),
.kernel_06(32'b10111100001001101100111110000011),
.kernel_07(32'b00111101111100001100000100110111),
.kernel_08(32'b10111011100000001110000101101000),
.pxl_out(pxl_out_188), .valid_out(valid_out_188) );

//Channel 189
conv_33 #(D, DATA_WIDTH) x189(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111110000000010101111100111001),
.kernel_01(32'b00111100101101100100110011001000),
.kernel_02(32'b00111110001101100001101111001110),
.kernel_03(32'b10111101010100111110000111010000),
.kernel_04(32'b00111110000011001101100011010100),
.kernel_05(32'b00111101101101000110110000011011),
.kernel_06(32'b10111101011001111000000110101100),
.kernel_07(32'b00111101101011110011111000110111),
.kernel_08(32'b10111100001010010101101110010001),
.pxl_out(pxl_out_189), .valid_out(valid_out_189) );

//Channel 190
conv_33 #(D, DATA_WIDTH) x190(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111101100110100111011100111000),
.kernel_01(32'b10111101110110110111110111101110),
.kernel_02(32'b00111100100010110000010100100000),
.kernel_03(32'b10111100001100000110101001101001),
.kernel_04(32'b00111101100000110100110011100110),
.kernel_05(32'b00111101111000001100010010011011),
.kernel_06(32'b10111110001001010111101100100100),
.kernel_07(32'b00111101101100111100001011111010),
.kernel_08(32'b00111011100011000011110111000100),
.pxl_out(pxl_out_190), .valid_out(valid_out_190) );

//Channel 191
conv_33 #(D, DATA_WIDTH) x191(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111101100101011100011101101111),
.kernel_01(32'b10111010010010101011001101101110),
.kernel_02(32'b00111110011000011000111101100010),
.kernel_03(32'b10111110110011110111111000011100),
.kernel_04(32'b10111100001111101100110001011110),
.kernel_05(32'b00111100100110010101011111101101),
.kernel_06(32'b00111101001110000010110111001100),
.kernel_07(32'b10111101110011001100111001111110),
.kernel_08(32'b10111110000000101001111111000100),
.pxl_out(pxl_out_191), .valid_out(valid_out_191) );

//Channel 192
conv_33 #(D, DATA_WIDTH) x192(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111110111111010110111111100111),
.kernel_01(32'b00111110100101100010011101101010),
.kernel_02(32'b00111101001001011011111001000100),
.kernel_03(32'b10111101110110000000100101100111),
.kernel_04(32'b10111101100110010000100111110100),
.kernel_05(32'b00111101110011111000110001000010),
.kernel_06(32'b10111110100000110111100110010100),
.kernel_07(32'b00111110011010000011000110101111),
.kernel_08(32'b10111000111101100111110110000011),
.pxl_out(pxl_out_192), .valid_out(valid_out_192) );

//Channel 193
conv_33 #(D, DATA_WIDTH) x193(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111101010011011100100101100011),
.kernel_01(32'b10111101010100100001010001010100),
.kernel_02(32'b10111100100101110110110011101010),
.kernel_03(32'b10111011100010100110110110100000),
.kernel_04(32'b10111100011000110110000111001110),
.kernel_05(32'b10111110001100010011011101000100),
.kernel_06(32'b00111101000011111011001010000111),
.kernel_07(32'b00111110001110001101000011101001),
.kernel_08(32'b00111101100000011011000011110000),
.pxl_out(pxl_out_193), .valid_out(valid_out_193) );

//Channel 194
conv_33 #(D, DATA_WIDTH) x194(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111101010101110100101000010111),
.kernel_01(32'b10111011100110000110001010011110),
.kernel_02(32'b00111101100010101101000001110011),
.kernel_03(32'b10111100001101101011100011111110),
.kernel_04(32'b00111101011001100000100010110000),
.kernel_05(32'b00111110110100011110111111000000),
.kernel_06(32'b10111100111110111010000010101111),
.kernel_07(32'b10111011011110110101111110011111),
.kernel_08(32'b00111110010101001011101010100111),
.pxl_out(pxl_out_194), .valid_out(valid_out_194) );

//Channel 195
conv_33 #(D, DATA_WIDTH) x195(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b10111100000100010111100000100111),
.kernel_01(32'b10111110010101111001001011011110),
.kernel_02(32'b00111100010001110101011000111100),
.kernel_03(32'b00111011001110010001001010011110),
.kernel_04(32'b10111100001011000110001001100000),
.kernel_05(32'b10111101011110011110010110000110),
.kernel_06(32'b10111101000000011111001111110001),
.kernel_07(32'b10111101010011000001000111001010),
.kernel_08(32'b10111110000011110011101110011000),
.pxl_out(pxl_out_195), .valid_out(valid_out_195) );

//Channel 196
conv_33 #(D, DATA_WIDTH) x196(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b10111101010110100001001111010011),
.kernel_01(32'b10111101001110000100101101111110),
.kernel_02(32'b10111101110100011011000111100110),
.kernel_03(32'b10111110011010100010000110110101),
.kernel_04(32'b00111101101110000000111100000000),
.kernel_05(32'b00111101000001011101101010111000),
.kernel_06(32'b10111110001011110000101111000110),
.kernel_07(32'b00111110100011001010010000000011),
.kernel_08(32'b00111101011010011011011000101010),
.pxl_out(pxl_out_196), .valid_out(valid_out_196) );

//Channel 197
conv_33 #(D, DATA_WIDTH) x197(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111100010110101001110110011001),
.kernel_01(32'b10111101110011110010111000111000),
.kernel_02(32'b00111110001011010011001110100110),
.kernel_03(32'b00111110000100101011101100100101),
.kernel_04(32'b00111100101001000001000000011011),
.kernel_05(32'b00111101101101001111110101000111),
.kernel_06(32'b00111101100111110011110001101001),
.kernel_07(32'b00111100110011001001110101010111),
.kernel_08(32'b10111100110011100101110001110111),
.pxl_out(pxl_out_197), .valid_out(valid_out_197) );

//Channel 198
conv_33 #(D, DATA_WIDTH) x198(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111101101011110000101101110001),
.kernel_01(32'b00111110000010011011001100100100),
.kernel_02(32'b00111100101001101000001100001101),
.kernel_03(32'b10111101000110000010001011000110),
.kernel_04(32'b10111110011111011001001111000101),
.kernel_05(32'b10111110100001000100000001110111),
.kernel_06(32'b00111110000001100110000110101000),
.kernel_07(32'b00111101100000000011011110101100),
.kernel_08(32'b00111100111110101110001110000011),
.pxl_out(pxl_out_198), .valid_out(valid_out_198) );

//Channel 199
conv_33 #(D, DATA_WIDTH) x199(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111101101000011110001001101110),
.kernel_01(32'b10111101011000000000110011100000),
.kernel_02(32'b10111101101001110001101001110101),
.kernel_03(32'b10111110000010100000111011100100),
.kernel_04(32'b10111101000100111011011011111101),
.kernel_05(32'b10111011000001001111101001010101),
.kernel_06(32'b10111101010011011100010010101011),
.kernel_07(32'b00111100110111111100100010111000),
.kernel_08(32'b00111110101001110000111000000000),
.pxl_out(pxl_out_199), .valid_out(valid_out_199) );

//Channel 200
conv_33 #(D, DATA_WIDTH) x200(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111101101010010001000110011011),
.kernel_01(32'b00111011011111001111000101010100),
.kernel_02(32'b00111110100100001010110011111010),
.kernel_03(32'b00111111001001111110110101001111),
.kernel_04(32'b10111101100001010000100000100000),
.kernel_05(32'b10111101010011110010011111001111),
.kernel_06(32'b00111100110000011111111010010100),
.kernel_07(32'b10111110100101101010110001001001),
.kernel_08(32'b00111101001110000100011001110011),
.pxl_out(pxl_out_200), .valid_out(valid_out_200) );

//Channel 201
conv_33 #(D, DATA_WIDTH) x201(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111110010110100100001111111001),
.kernel_01(32'b00111101111101110010101011110101),
.kernel_02(32'b10111110011011101110001111110111),
.kernel_03(32'b10111110100100000110000011010110),
.kernel_04(32'b10111101000101101101110101000111),
.kernel_05(32'b10111100110100011110110110010110),
.kernel_06(32'b00111101100110001011010100100110),
.kernel_07(32'b00111101100101010010110000011100),
.kernel_08(32'b00111101010100010001110011011011),
.pxl_out(pxl_out_201), .valid_out(valid_out_201) );

//Channel 202
conv_33 #(D, DATA_WIDTH) x202(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b10111110100010001000101110000110),
.kernel_01(32'b00111011110000011000101010101101),
.kernel_02(32'b10111100101010011000101101101000),
.kernel_03(32'b00111101100001000110010010111101),
.kernel_04(32'b10111101100000111010011111100000),
.kernel_05(32'b00111110100000010111101001000011),
.kernel_06(32'b00111110100000101010000100001011),
.kernel_07(32'b00111101101011001001110001100010),
.kernel_08(32'b10111011000111000111001010101101),
.pxl_out(pxl_out_202), .valid_out(valid_out_202) );

//Channel 203
conv_33 #(D, DATA_WIDTH) x203(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b00111100110010111011011111001100),
.kernel_01(32'b00111010101111101101011011010111),
.kernel_02(32'b00111100101100111010011111011110),
.kernel_03(32'b10111110001010100001010101110010),
.kernel_04(32'b00111110011011111000001010000011),
.kernel_05(32'b00111100110011001111001100001111),
.kernel_06(32'b10111100001000001011110000101010),
.kernel_07(32'b10111101100010111100110111100101),
.kernel_08(32'b10111101111100010000111110110110),
.pxl_out(pxl_out_203), .valid_out(valid_out_203) );

//Channel 204
conv_33 #(D, DATA_WIDTH) x204(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111110001100011100101111000100),
.kernel_01(32'b10111100100110000100111011110010),
.kernel_02(32'b00111110110101100000111111001001),
.kernel_03(32'b00111101001100011101010110101101),
.kernel_04(32'b10111110111001010001001000100100),
.kernel_05(32'b10111100100101001111000011000011),
.kernel_06(32'b00111100110101001001111100010110),
.kernel_07(32'b10111101111110010011000100011001),
.kernel_08(32'b10111110001010111011001001000000),
.pxl_out(pxl_out_204), .valid_out(valid_out_204) );

//Channel 205
conv_33 #(D, DATA_WIDTH) x205(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111100100011101110011101010000),
.kernel_01(32'b10111100111011111000011110110101),
.kernel_02(32'b10111111010111001010101101101101),
.kernel_03(32'b10111110010011011101010101100101),
.kernel_04(32'b00111101100011111110111101111101),
.kernel_05(32'b10111110011110011010101101110111),
.kernel_06(32'b10111101000001010010110100110010),
.kernel_07(32'b00111110100000001100000010001001),
.kernel_08(32'b10111100101100110010111001110000),
.pxl_out(pxl_out_205), .valid_out(valid_out_205) );

//Channel 206
conv_33 #(D, DATA_WIDTH) x206(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b10111101101001001101001101100010),
.kernel_01(32'b10111100011011110111011111111001),
.kernel_02(32'b10111011110100100100110100011100),
.kernel_03(32'b00111100101001110110010100101010),
.kernel_04(32'b10111010011001111001010000110000),
.kernel_05(32'b00111110110010111001000000101010),
.kernel_06(32'b00111100111100100100010111101001),
.kernel_07(32'b00111101001001010011110001000011),
.kernel_08(32'b10111110101011111000011001010000),
.pxl_out(pxl_out_206), .valid_out(valid_out_206) );

//Channel 207
conv_33 #(D, DATA_WIDTH) x207(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111110101010010011111101111011),
.kernel_01(32'b00111110100001000110100010000010),
.kernel_02(32'b10111110111100010110000000010101),
.kernel_03(32'b00111110010001010100110001010011),
.kernel_04(32'b10111110011011001101001110011100),
.kernel_05(32'b10111100100010011010100101010010),
.kernel_06(32'b10111011010100011110110110110000),
.kernel_07(32'b00111101010000011001011010010101),
.kernel_08(32'b10111110100000110100001000001000),
.pxl_out(pxl_out_207), .valid_out(valid_out_207) );

//Channel 208
conv_33 #(D, DATA_WIDTH) x208(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111100100000100011111110011011),
.kernel_01(32'b10111101101101101011111010011000),
.kernel_02(32'b00111110100001011011111001011010),
.kernel_03(32'b10111110011010100110100100100100),
.kernel_04(32'b10111101001101001110111001010011),
.kernel_05(32'b10111101100011100010011110100110),
.kernel_06(32'b00111110001110010100100110100011),
.kernel_07(32'b10111101110101001000101111011011),
.kernel_08(32'b10111011101010110010111010000001),
.pxl_out(pxl_out_208), .valid_out(valid_out_208) );

//Channel 209
conv_33 #(D, DATA_WIDTH) x209(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b00111101111011001100000011101000),
.kernel_01(32'b10111111011101101110110100000011),
.kernel_02(32'b00111101010101010100101001001101),
.kernel_03(32'b00111101010010101111100001100100),
.kernel_04(32'b10111101000001011111010110011010),
.kernel_05(32'b00111100000101010001111101001110),
.kernel_06(32'b10111101101000100001011100110111),
.kernel_07(32'b00111101000001111001010100101100),
.kernel_08(32'b10111110000101010000001110011111),
.pxl_out(pxl_out_209), .valid_out(valid_out_209) );

//Channel 210
conv_33 #(D, DATA_WIDTH) x210(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111001100101001010010101010100),
.kernel_01(32'b10111101101011111101101101110001),
.kernel_02(32'b00111110000100111010000001110111),
.kernel_03(32'b00111110110001100011010110011000),
.kernel_04(32'b00111101100011101010011100101010),
.kernel_05(32'b00111111100001111110001010110001),
.kernel_06(32'b10111101101100001101000000001001),
.kernel_07(32'b00111101101011000010010000001010),
.kernel_08(32'b10111101100111000110111111111111),
.pxl_out(pxl_out_210), .valid_out(valid_out_210) );

//Channel 211
conv_33 #(D, DATA_WIDTH) x211(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111110011110000000110000001101),
.kernel_01(32'b10111101100001001000001110011110),
.kernel_02(32'b10111101000100001101111010010011),
.kernel_03(32'b00111110110010101010100001100010),
.kernel_04(32'b10111100101000101110010100111000),
.kernel_05(32'b10111110010010010100111010101111),
.kernel_06(32'b10111011000010000010010011011011),
.kernel_07(32'b00111100100110101001001011010010),
.kernel_08(32'b00111110000111011110101001000100),
.pxl_out(pxl_out_211), .valid_out(valid_out_211) );

//Channel 212
conv_33 #(D, DATA_WIDTH) x212(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111011111010100001001111110100),
.kernel_01(32'b00111100010001000000010000111001),
.kernel_02(32'b00111100101001111100110110000100),
.kernel_03(32'b10111111000110000110000100010111),
.kernel_04(32'b10111101110000010110010101111101),
.kernel_05(32'b10111110011110000110001011100000),
.kernel_06(32'b00111111011000111101011001110100),
.kernel_07(32'b10111100111000011101011111001010),
.kernel_08(32'b00111101001111000010010011111001),
.pxl_out(pxl_out_212), .valid_out(valid_out_212) );

//Channel 213
conv_33 #(D, DATA_WIDTH) x213(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111100001100101110001110010111),
.kernel_01(32'b00111101110000100010111100001110),
.kernel_02(32'b00111100101100100101101000110011),
.kernel_03(32'b10111101011000010100011011110100),
.kernel_04(32'b00111110000001111110101000100001),
.kernel_05(32'b10111011010011000110001100101100),
.kernel_06(32'b00111111000000110011110011010001),
.kernel_07(32'b10111101011111011110000011000101),
.kernel_08(32'b10111110100100111111010010000000),
.pxl_out(pxl_out_213), .valid_out(valid_out_213) );

//Channel 214
conv_33 #(D, DATA_WIDTH) x214(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111111000010001101110111011010),
.kernel_01(32'b10111111011000101111100000011001),
.kernel_02(32'b00111101001011010011101001011101),
.kernel_03(32'b10111101011010001100100101000110),
.kernel_04(32'b10111101001100000000011111001000),
.kernel_05(32'b10111101000011101111010111001110),
.kernel_06(32'b00111100010101110000100111101110),
.kernel_07(32'b10111100101110110010111011010010),
.kernel_08(32'b00111100100001101100000110100010),
.pxl_out(pxl_out_214), .valid_out(valid_out_214) );

//Channel 215
conv_33 #(D, DATA_WIDTH) x215(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111111000001001111011100010110),
.kernel_01(32'b00111101010001101000111001011001),
.kernel_02(32'b10111100001101101100000111011110),
.kernel_03(32'b00111110111000001000010101100010),
.kernel_04(32'b10111110101011001100001000010010),
.kernel_05(32'b10111110011011110001010110000110),
.kernel_06(32'b00111101101101100001001110101111),
.kernel_07(32'b10111101110010101101110110100000),
.kernel_08(32'b00111100000001110111010111010000),
.pxl_out(pxl_out_215), .valid_out(valid_out_215) );

//Channel 216
conv_33 #(D, DATA_WIDTH) x216(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111101001111010110001001010000),
.kernel_01(32'b00111110001001001100001100101100),
.kernel_02(32'b00111101000010001100111101000000),
.kernel_03(32'b00111100111111010111111001000010),
.kernel_04(32'b00111100110100101101100000100100),
.kernel_05(32'b00111101001111110110110011101001),
.kernel_06(32'b10111110011101101011101001000110),
.kernel_07(32'b10111110101000011001101100110001),
.kernel_08(32'b00111101001000101011110110100000),
.pxl_out(pxl_out_216), .valid_out(valid_out_216) );

//Channel 217
conv_33 #(D, DATA_WIDTH) x217(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b10111101101000101000001110011001),
.kernel_01(32'b00111101001100011101001100111100),
.kernel_02(32'b10111100101111000010000011001010),
.kernel_03(32'b10111100100000101000100011110001),
.kernel_04(32'b00111110100101101011010101101000),
.kernel_05(32'b10111101010100111101000101010010),
.kernel_06(32'b00111101001110001011001000110001),
.kernel_07(32'b00111101001110000110110010101001),
.kernel_08(32'b00111110000011011010000111001011),
.pxl_out(pxl_out_217), .valid_out(valid_out_217) );

//Channel 218
conv_33 #(D, DATA_WIDTH) x218(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b00111101110100101010011001001011),
.kernel_01(32'b10111110001110101111110000011100),
.kernel_02(32'b00111110010010000100111111010010),
.kernel_03(32'b00111100000000010101011100101111),
.kernel_04(32'b10111110010001111111000101111110),
.kernel_05(32'b10111101010001101001111101100001),
.kernel_06(32'b10111100000001110111110010001011),
.kernel_07(32'b10111101101010010100010011101000),
.kernel_08(32'b10111101100100001011011110100100),
.pxl_out(pxl_out_218), .valid_out(valid_out_218) );

//Channel 219
conv_33 #(D, DATA_WIDTH) x219(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b10111101111101111101100111110101),
.kernel_01(32'b10111101000001011101111001110010),
.kernel_02(32'b10111100110000100110010001110100),
.kernel_03(32'b10111110110001110001110001101100),
.kernel_04(32'b10111110000111111101101101011001),
.kernel_05(32'b10111100010100000101111010010010),
.kernel_06(32'b10111101110011001100001101000001),
.kernel_07(32'b10111111100011011010110011010011),
.kernel_08(32'b00111101000110101000100000100110),
.pxl_out(pxl_out_219), .valid_out(valid_out_219) );

//Channel 220
conv_33 #(D, DATA_WIDTH) x220(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111101101011001110010110110000),
.kernel_01(32'b00111101111111011010011100000011),
.kernel_02(32'b10111110010000000001011110011011),
.kernel_03(32'b10111101000101111111110000010101),
.kernel_04(32'b00111101101110011110001101010011),
.kernel_05(32'b10111101110111010101101010100001),
.kernel_06(32'b00111101011110101110011110011001),
.kernel_07(32'b10111110001101010000010100110100),
.kernel_08(32'b10111100110110110100000101001110),
.pxl_out(pxl_out_220), .valid_out(valid_out_220) );

//Channel 221
conv_33 #(D, DATA_WIDTH) x221(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111101100100011110111001001100),
.kernel_01(32'b00111110100001001001000111011011),
.kernel_02(32'b00111111100111011011001000001011),
.kernel_03(32'b10111011011111011110010011100001),
.kernel_04(32'b00111101100110010101000000100010),
.kernel_05(32'b10111110001010110111101111111111),
.kernel_06(32'b10111100111011010101100010001000),
.kernel_07(32'b00111101100100001100100000001001),
.kernel_08(32'b00111011010011011011000101000100),
.pxl_out(pxl_out_221), .valid_out(valid_out_221) );

//Channel 222
conv_33 #(D, DATA_WIDTH) x222(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111101110011110000010001001101),
.kernel_01(32'b00111110010011111001101100001110),
.kernel_02(32'b10111101101000110000001010101000),
.kernel_03(32'b00111101110001100110100100101010),
.kernel_04(32'b10111110011110101110011010011100),
.kernel_05(32'b00111110100000100010010010111011),
.kernel_06(32'b10111101100110110001010110011011),
.kernel_07(32'b00111110001100001111111010101000),
.kernel_08(32'b10111110000000110011100101101101),
.pxl_out(pxl_out_222), .valid_out(valid_out_222) );

//Channel 223
conv_33 #(D, DATA_WIDTH) x223(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111110000111101111010000000100),
.kernel_01(32'b10111101001111101001101000001101),
.kernel_02(32'b10111110100111101011001101001000),
.kernel_03(32'b10111101110001100111010100010001),
.kernel_04(32'b10111101010001010100100010010000),
.kernel_05(32'b10111101101001000010011000111101),
.kernel_06(32'b00111101100111001001010110110101),
.kernel_07(32'b10111110001101111000011010110100),
.kernel_08(32'b10111101101001000010100111111011),
.pxl_out(pxl_out_223), .valid_out(valid_out_223) );

//Channel 224
conv_33 #(D, DATA_WIDTH) x224(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b00111101111010001001011001011111),
.kernel_01(32'b10111101101100101011110100111110),
.kernel_02(32'b00111101010011110011101011110001),
.kernel_03(32'b10111110001110111001000001100010),
.kernel_04(32'b00111111001000011010110010111001),
.kernel_05(32'b10111111000100000001110100110010),
.kernel_06(32'b10111110011000110101111110001010),
.kernel_07(32'b00111110100001111010100100101010),
.kernel_08(32'b00111101011111110101011001110000),
.pxl_out(pxl_out_224), .valid_out(valid_out_224) );

//Channel 225
conv_33 #(D, DATA_WIDTH) x225(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111101010000000010011110101000),
.kernel_01(32'b10111101111110011000011010001010),
.kernel_02(32'b00111101010101010101111000111111),
.kernel_03(32'b10111110000110000111011000011000),
.kernel_04(32'b10111011001100001100011010011110),
.kernel_05(32'b10111110001110101011100100010100),
.kernel_06(32'b00111101100000001011111010010010),
.kernel_07(32'b00111110000000000001011010100111),
.kernel_08(32'b10111100010000001101111110011111),
.pxl_out(pxl_out_225), .valid_out(valid_out_225) );

//Channel 226
conv_33 #(D, DATA_WIDTH) x226(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111101011010101100000101001000),
.kernel_01(32'b00111110000101011101101100110100),
.kernel_02(32'b10111101110111010010001111110100),
.kernel_03(32'b10111010100100000111001011111110),
.kernel_04(32'b00111101101011100000001110101101),
.kernel_05(32'b00111111000000101101001011010111),
.kernel_06(32'b00111101011010001100101100011101),
.kernel_07(32'b10111110100101011111110000011000),
.kernel_08(32'b00111111000100011100011110000011),
.pxl_out(pxl_out_226), .valid_out(valid_out_226) );

//Channel 227
conv_33 #(D, DATA_WIDTH) x227(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b10111101011011111010001000011010),
.kernel_01(32'b10111101000010010011110100100101),
.kernel_02(32'b00111101101001011001101100110000),
.kernel_03(32'b00111101011000010001010101111010),
.kernel_04(32'b00111100100100010111110001110101),
.kernel_05(32'b10111110000110010001000001110011),
.kernel_06(32'b00111110000010001011011111110110),
.kernel_07(32'b00111010101111000000001111101100),
.kernel_08(32'b00111100110111001011010010110101),
.pxl_out(pxl_out_227), .valid_out(valid_out_227) );

//Channel 228
conv_33 #(D, DATA_WIDTH) x228(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111100111001101101110100110110),
.kernel_01(32'b10111110101100001000001101101010),
.kernel_02(32'b10111101110111111011011111110001),
.kernel_03(32'b10111111001010001011101011101101),
.kernel_04(32'b10111110000001100010010000111111),
.kernel_05(32'b00111101100000001101010011001101),
.kernel_06(32'b00111101101010111000010010000111),
.kernel_07(32'b10111101100100000111010001011001),
.kernel_08(32'b00111100000110000111100101000100),
.pxl_out(pxl_out_228), .valid_out(valid_out_228) );

//Channel 229
conv_33 #(D, DATA_WIDTH) x229(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b10111110010001111010011011000100),
.kernel_01(32'b00111101011011001001101101101000),
.kernel_02(32'b10111101101110001111000111010100),
.kernel_03(32'b10111010100010100011111110111011),
.kernel_04(32'b10111101110001011001101011100001),
.kernel_05(32'b10111101101010101100100100001001),
.kernel_06(32'b00111101001010110111100000010010),
.kernel_07(32'b00111100100111000111100011111010),
.kernel_08(32'b10111101000011101010111110011111),
.pxl_out(pxl_out_229), .valid_out(valid_out_229) );

//Channel 230
conv_33 #(D, DATA_WIDTH) x230(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b10111101110100111000011101101001),
.kernel_01(32'b00111100111101000011110011100100),
.kernel_02(32'b10111110000001101101001011001010),
.kernel_03(32'b00111100100100000011001101110100),
.kernel_04(32'b10111110001101000111110000111100),
.kernel_05(32'b10111100001101111101000100100010),
.kernel_06(32'b10111101010110111010101101010010),
.kernel_07(32'b10111101010000111111000101000111),
.kernel_08(32'b10111101100010010100001000000010),
.pxl_out(pxl_out_230), .valid_out(valid_out_230) );

//Channel 231
conv_33 #(D, DATA_WIDTH) x231(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b00111101001100101010100100110101),
.kernel_01(32'b10111101111010101100111100100111),
.kernel_02(32'b00111101100100100001000111111111),
.kernel_03(32'b10111101000101110011000101101100),
.kernel_04(32'b00111101101111110010100111100001),
.kernel_05(32'b10111101100111100001101100100001),
.kernel_06(32'b10111101001011110100011010100000),
.kernel_07(32'b00111101010001001010010110001101),
.kernel_08(32'b00111110001001010000111011011101),
.pxl_out(pxl_out_231), .valid_out(valid_out_231) );

//Channel 232
conv_33 #(D, DATA_WIDTH) x232(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111100110101101100100110011111),
.kernel_01(32'b00111101111000101100110000000011),
.kernel_02(32'b00111100000110001000110000110110),
.kernel_03(32'b10111100010110011100011100011111),
.kernel_04(32'b10111100010011000111001101111000),
.kernel_05(32'b10111110001101001101101100111011),
.kernel_06(32'b00111100110110000000110101110111),
.kernel_07(32'b00111011100100001011101111100111),
.kernel_08(32'b00111101011011110110110000101010),
.pxl_out(pxl_out_232), .valid_out(valid_out_232) );

//Channel 233
conv_33 #(D, DATA_WIDTH) x233(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111101100010001000111001101100),
.kernel_01(32'b10111100110000111110001101000011),
.kernel_02(32'b00111100111000011011000111100011),
.kernel_03(32'b10111100111100100110100001111100),
.kernel_04(32'b10111100011001011110101101110110),
.kernel_05(32'b10111110000110010001110011111001),
.kernel_06(32'b00111101010111011111100111110000),
.kernel_07(32'b10111101100001001011000011101011),
.kernel_08(32'b00111101001000101001011111101100),
.pxl_out(pxl_out_233), .valid_out(valid_out_233) );

//Channel 234
conv_33 #(D, DATA_WIDTH) x234(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b10111101111101000001111111011000),
.kernel_01(32'b00111100111000100111001101001110),
.kernel_02(32'b10111101100100000101001111000100),
.kernel_03(32'b00111011111010000100011111001101),
.kernel_04(32'b10111101001111100011001001101100),
.kernel_05(32'b10111011011011100111011011001010),
.kernel_06(32'b10111101011111010001010111011100),
.kernel_07(32'b00111101011001001010001110101000),
.kernel_08(32'b00111011111110000011010110101011),
.pxl_out(pxl_out_234), .valid_out(valid_out_234) );

//Channel 235
conv_33 #(D, DATA_WIDTH) x235(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111101010010001010000110101110),
.kernel_01(32'b10111100101001001100100000001111),
.kernel_02(32'b10111010000010100011111000000000),
.kernel_03(32'b00111101100110111101000111100101),
.kernel_04(32'b00111101101011010000010111110011),
.kernel_05(32'b10111100101000011000011010010101),
.kernel_06(32'b10111101110100100101001001101000),
.kernel_07(32'b10111101001000000010000101110111),
.kernel_08(32'b00111100101110000110011101100011),
.pxl_out(pxl_out_235), .valid_out(valid_out_235) );

//Channel 236
conv_33 #(D, DATA_WIDTH) x236(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b10111010101011110011001101111000),
.kernel_01(32'b10111100010001110101001010010100),
.kernel_02(32'b10111101101101010100110111011001),
.kernel_03(32'b00111011100101111001000101000010),
.kernel_04(32'b10111101010001111101000101111010),
.kernel_05(32'b00111101000101100001101101100101),
.kernel_06(32'b00111100110000100110001110011010),
.kernel_07(32'b00111101100000110101111101110011),
.kernel_08(32'b10111101100100100101100000011011),
.pxl_out(pxl_out_236), .valid_out(valid_out_236) );

//Channel 237
conv_33 #(D, DATA_WIDTH) x237(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111110011000011110000110011110),
.kernel_01(32'b00111101011000111110001100111110),
.kernel_02(32'b10111101101000000010010110110011),
.kernel_03(32'b00111011110000101101101101101101),
.kernel_04(32'b00111101111010010110011010010011),
.kernel_05(32'b00111101111110111001110100101110),
.kernel_06(32'b00111101111010010111001110101001),
.kernel_07(32'b10111101100101101100010111110101),
.kernel_08(32'b10111101100010100111100101000001),
.pxl_out(pxl_out_237), .valid_out(valid_out_237) );

//Channel 238
conv_33 #(D, DATA_WIDTH) x238(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111101010011011011001111001001),
.kernel_01(32'b00111011001000000001101100011000),
.kernel_02(32'b10111101010111111000110111101011),
.kernel_03(32'b10111101010010000100100100011010),
.kernel_04(32'b10111101001001110010011100100000),
.kernel_05(32'b10111100000010101101001000001111),
.kernel_06(32'b10111101000101111000000011001000),
.kernel_07(32'b00111110001010100011111000010100),
.kernel_08(32'b10111100101000111010110001100111),
.pxl_out(pxl_out_238), .valid_out(valid_out_238) );

//Channel 239
conv_33 #(D, DATA_WIDTH) x239(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b10111110000001110110001010100010),
.kernel_01(32'b00111101101101011001100110111101),
.kernel_02(32'b10111110100000001101101011011001),
.kernel_03(32'b10111100011001101011111011100100),
.kernel_04(32'b10111100010100000111011101011101),
.kernel_05(32'b10111101000001010001010100011011),
.kernel_06(32'b10111100100100000000011010101000),
.kernel_07(32'b10111110010101100100111011101101),
.kernel_08(32'b10111101100010001111000111100011),
.pxl_out(pxl_out_239), .valid_out(valid_out_239) );

//Channel 240
conv_33 #(D, DATA_WIDTH) x240(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111101000111100100101101110110),
.kernel_01(32'b10111100111010101010001001100000),
.kernel_02(32'b00111101011010000101111111000001),
.kernel_03(32'b00111101010001011110001100110100),
.kernel_04(32'b00111011011011001011001010000110),
.kernel_05(32'b00111101101110010111101011101011),
.kernel_06(32'b00111101110010111100101001111010),
.kernel_07(32'b10111101111101100001000011011011),
.kernel_08(32'b10111101010000100111011000001011),
.pxl_out(pxl_out_240), .valid_out(valid_out_240) );

//Channel 241
conv_33 #(D, DATA_WIDTH) x241(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b00111101110101011000111010111000),
.kernel_01(32'b00111110101110110101100000000011),
.kernel_02(32'b00111110000000100100111000000100),
.kernel_03(32'b00111101100100001101101010000100),
.kernel_04(32'b10111110010000110100111010111101),
.kernel_05(32'b00111101010001111111001110000111),
.kernel_06(32'b10111100010000111010000100010000),
.kernel_07(32'b00111100110000101101100100010001),
.kernel_08(32'b00111100100101111101010111001101),
.pxl_out(pxl_out_241), .valid_out(valid_out_241) );

//Channel 242
conv_33 #(D, DATA_WIDTH) x242(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b00111100010101011000001101000001),
.kernel_01(32'b00111110000011111100010000011000),
.kernel_02(32'b10111101001010001110001010101100),
.kernel_03(32'b00111110000110111101000010110011),
.kernel_04(32'b10111100100010011000100001111010),
.kernel_05(32'b10111110100110010111101010100010),
.kernel_06(32'b00111011110001000011101001110100),
.kernel_07(32'b10111110010001101001110000110111),
.kernel_08(32'b00111101100000110010010110111010),
.pxl_out(pxl_out_242), .valid_out(valid_out_242) );

//Channel 243
conv_33 #(D, DATA_WIDTH) x243(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111101100110001101110000011000),
.kernel_01(32'b10111011101011100111101100101000),
.kernel_02(32'b00111100111011111011011111000011),
.kernel_03(32'b10111101101101100101011110001111),
.kernel_04(32'b00111110000101011110101011010001),
.kernel_05(32'b00111101100101110001000000101110),
.kernel_06(32'b10111110010010001100101000000011),
.kernel_07(32'b00111101010101111110001101110001),
.kernel_08(32'b10111101000011111010100000111001),
.pxl_out(pxl_out_243), .valid_out(valid_out_243) );

//Channel 244
conv_33 #(D, DATA_WIDTH) x244(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111101101010011101001000001001),
.kernel_01(32'b10111101110010000100111000111001),
.kernel_02(32'b10111100100011011110100000110110),
.kernel_03(32'b10111101010001000010101110011101),
.kernel_04(32'b10111100010101111111110100001001),
.kernel_05(32'b10111100100111010011100000000110),
.kernel_06(32'b10111110000100011001101011001010),
.kernel_07(32'b10111011101000011110000000100011),
.kernel_08(32'b00111101000111000101001011100010),
.pxl_out(pxl_out_244), .valid_out(valid_out_244) );

//Channel 245
conv_33 #(D, DATA_WIDTH) x245(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111101100101010111011000000110),
.kernel_01(32'b10111101111011110110010011100011),
.kernel_02(32'b10111101110000100100101111000000),
.kernel_03(32'b10111101111101000110011110001110),
.kernel_04(32'b10111101001101001001101100010100),
.kernel_05(32'b00111101110110011110001110001011),
.kernel_06(32'b00111100111001101000011101011010),
.kernel_07(32'b00111110001011010001010101000101),
.kernel_08(32'b10111101100011011111011011110010),
.pxl_out(pxl_out_245), .valid_out(valid_out_245) );

//Channel 246
conv_33 #(D, DATA_WIDTH) x246(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b00111101000100010010010111000100),
.kernel_01(32'b00111110011111010100101000011100),
.kernel_02(32'b00111100111011100110101100111001),
.kernel_03(32'b10111110000100011000101111111100),
.kernel_04(32'b10111101011010110111101011011101),
.kernel_05(32'b10111101100001000111111000111001),
.kernel_06(32'b10111101110111100011001001111010),
.kernel_07(32'b10111011001110010011001101011001),
.kernel_08(32'b00111101110110000011011011101100),
.pxl_out(pxl_out_246), .valid_out(valid_out_246) );

//Channel 247
conv_33 #(D, DATA_WIDTH) x247(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111110001110111111100010110110),
.kernel_01(32'b00111100101110001010001100100110),
.kernel_02(32'b00111101111111001101000010101010),
.kernel_03(32'b10111101111101111100100001101110),
.kernel_04(32'b10111110100101100100011100101101),
.kernel_05(32'b00111110001110111000100010111110),
.kernel_06(32'b00111010101011001110001100010011),
.kernel_07(32'b00111110001101110101100000111101),
.kernel_08(32'b00111110000000011011001110000011),
.pxl_out(pxl_out_247), .valid_out(valid_out_247) );

//Channel 248
conv_33 #(D, DATA_WIDTH) x248(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b10111100111010000001111110100000),
.kernel_01(32'b00111110000111111010001111001110),
.kernel_02(32'b10111110001001000010100000001111),
.kernel_03(32'b10111101101100110110111001110110),
.kernel_04(32'b10111101101100010111101010001001),
.kernel_05(32'b10111101111000100100101011110100),
.kernel_06(32'b10111110010000111111111011110110),
.kernel_07(32'b10111110000011100001110100100101),
.kernel_08(32'b00111101100100011011100111100001),
.pxl_out(pxl_out_248), .valid_out(valid_out_248) );

//Channel 249
conv_33 #(D, DATA_WIDTH) x249(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b10111100001110101101011111010100),
.kernel_01(32'b10111110000101111111011010111110),
.kernel_02(32'b00111101000001000111010001110001),
.kernel_03(32'b10111100100101000101010110100010),
.kernel_04(32'b10111110100001001011111100011100),
.kernel_05(32'b00111101011000001010000110000111),
.kernel_06(32'b00111110100110101100110111100110),
.kernel_07(32'b00111100100110100010000010000101),
.kernel_08(32'b10111101000011111000101101110111),
.pxl_out(pxl_out_249), .valid_out(valid_out_249) );

//Channel 250
conv_33 #(D, DATA_WIDTH) x250(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b00111101100000001100000000010110),
.kernel_01(32'b00111101011011101010110100101011),
.kernel_02(32'b10111101110010111111011101010100),
.kernel_03(32'b10111101100001100111101011011110),
.kernel_04(32'b00111101101001111010110100110101),
.kernel_05(32'b00111101011000001110101101011100),
.kernel_06(32'b00111101001100011001111001100110),
.kernel_07(32'b10111100100101111111111110100111),
.kernel_08(32'b00111101010000111101001001110101),
.pxl_out(pxl_out_250), .valid_out(valid_out_250) );

//Channel 251
conv_33 #(D, DATA_WIDTH) x251(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111101101001011011100001010001),
.kernel_01(32'b10111101000111001010000000000011),
.kernel_02(32'b10111101100111111010001010010010),
.kernel_03(32'b00111101001001101000101110111100),
.kernel_04(32'b00111110001110100111001011100111),
.kernel_05(32'b00111101111011000101011001000110),
.kernel_06(32'b00111101010000101100110010111000),
.kernel_07(32'b00111010111111110111110001100010),
.kernel_08(32'b00111011011001001110010110000000),
.pxl_out(pxl_out_251), .valid_out(valid_out_251) );

//Channel 252
conv_33 #(D, DATA_WIDTH) x252(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111110010001111110010001001010),
.kernel_01(32'b10111101100101011001101110010000),
.kernel_02(32'b00111011111010010100101010000100),
.kernel_03(32'b00111101001111101101100111101111),
.kernel_04(32'b10111110000100110000111000110000),
.kernel_05(32'b00111011101010101101111111110111),
.kernel_06(32'b10111101011001101010000101101011),
.kernel_07(32'b00111101110111001000001011011100),
.kernel_08(32'b10111110001110111010000110010100),
.pxl_out(pxl_out_252), .valid_out(valid_out_252) );

//Channel 253
conv_33 #(D, DATA_WIDTH) x253(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111101010010110110101100011001),
.kernel_01(32'b10111101111011110101101011110011),
.kernel_02(32'b10111110001100001111110001011001),
.kernel_03(32'b10111010000100010101110100100101),
.kernel_04(32'b10111110011010011101010001000011),
.kernel_05(32'b10111101000101101111001110010100),
.kernel_06(32'b00111101111100000001000000001000),
.kernel_07(32'b00111101001111001001000010010110),
.kernel_08(32'b00111100001111110100010100101000),
.pxl_out(pxl_out_253), .valid_out(valid_out_253) );

//Channel 254
conv_33 #(D, DATA_WIDTH) x254(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111101100110010111011011110000),
.kernel_01(32'b10111110000111010111110110101110),
.kernel_02(32'b00111101001000010111011001101010),
.kernel_03(32'b00111100100101001010011111100101),
.kernel_04(32'b00111011011100101101011011011011),
.kernel_05(32'b10111101100000001110001000011110),
.kernel_06(32'b10111100011100001111100101111000),
.kernel_07(32'b00111110000110100110011010101001),
.kernel_08(32'b00111110001011001011101011010010),
.pxl_out(pxl_out_254), .valid_out(valid_out_254) );

//Channel 255
conv_33 #(D, DATA_WIDTH) x255(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b00111100111100010111100011101011),
.kernel_01(32'b10111101000101100100010100000010),
.kernel_02(32'b00111101000110111101000110110011),
.kernel_03(32'b10111101011001101000010101010001),
.kernel_04(32'b00111101100110101111111010111100),
.kernel_05(32'b00111011111101111100110000000111),
.kernel_06(32'b10111101101111000000101010000101),
.kernel_07(32'b10111110010010111010111100001100),
.kernel_08(32'b10111100000010101101010111110010),
.pxl_out(pxl_out_255), .valid_out(valid_out_255) );

//Channel 256
conv_33 #(D, DATA_WIDTH) x256(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111100010011001001001010001110),
.kernel_01(32'b10111101011010010001010110001101),
.kernel_02(32'b10111011111011010001110010000111),
.kernel_03(32'b00111101000101110011100111000000),
.kernel_04(32'b00111101010101111111001011010010),
.kernel_05(32'b00111110000101111100010001010000),
.kernel_06(32'b00111011001010110101111100011111),
.kernel_07(32'b10111101111010011010100111110111),
.kernel_08(32'b10111011111100101100110111111011),
.pxl_out(pxl_out_256), .valid_out(valid_out_256) );

//Channel 257
conv_33 #(D, DATA_WIDTH) x257(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111110010011111010101001000010),
.kernel_01(32'b10111011100000101000001001010110),
.kernel_02(32'b10111101110000100110111011011100),
.kernel_03(32'b00111100101000100111011001111101),
.kernel_04(32'b10111100010011001001111010111010),
.kernel_05(32'b00111101110110101111100001100000),
.kernel_06(32'b00111100100110000100111110010111),
.kernel_07(32'b00111101100000000101011000011010),
.kernel_08(32'b10111101100001111110111001110111),
.pxl_out(pxl_out_257), .valid_out(valid_out_257) );

//Channel 258
conv_33 #(D, DATA_WIDTH) x258(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111101011010011001110000110010),
.kernel_01(32'b00111101011101100000110001010010),
.kernel_02(32'b10111101001010001110011011111001),
.kernel_03(32'b00111100011000011001110111111010),
.kernel_04(32'b10111110001111111010001010010111),
.kernel_05(32'b00111110000100011110001101111011),
.kernel_06(32'b00111100111000100011110011110111),
.kernel_07(32'b00111011000010101010100100100010),
.kernel_08(32'b10111110000011011100000000011111),
.pxl_out(pxl_out_258), .valid_out(valid_out_258) );

//Channel 259
conv_33 #(D, DATA_WIDTH) x259(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111101001011000000011101100010),
.kernel_01(32'b10111101010000101010001100000110),
.kernel_02(32'b00111101101001111101010010111110),
.kernel_03(32'b00111100110011011011100111010000),
.kernel_04(32'b00111101011110101000011101110111),
.kernel_05(32'b00111011001000011100010101000110),
.kernel_06(32'b10111101000111010111101011010011),
.kernel_07(32'b00111101101101001010010011110110),
.kernel_08(32'b10111110010110100000000010000100),
.pxl_out(pxl_out_259), .valid_out(valid_out_259) );

//Channel 260
conv_33 #(D, DATA_WIDTH) x260(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111100111010110101010111100010),
.kernel_01(32'b00111100011010101011010000100011),
.kernel_02(32'b00111110001011010011111011000110),
.kernel_03(32'b00111110001100110101000001100000),
.kernel_04(32'b10111100111110001011100100110011),
.kernel_05(32'b10111110000011000010110100110111),
.kernel_06(32'b10111101101100000101001010101101),
.kernel_07(32'b10111101010101000111110100100001),
.kernel_08(32'b00111101101110110101110001011101),
.pxl_out(pxl_out_260), .valid_out(valid_out_260) );

//Channel 261
conv_33 #(D, DATA_WIDTH) x261(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b10111100100011111011100101111111),
.kernel_01(32'b00111100111000000110111101000001),
.kernel_02(32'b10111100111100000000000000101010),
.kernel_03(32'b00111100111111000011000111000110),
.kernel_04(32'b00111110000001110101001010100101),
.kernel_05(32'b00111110001110001010010111110111),
.kernel_06(32'b10111101110000010011100010101110),
.kernel_07(32'b00111101001110110110001011100111),
.kernel_08(32'b00111100011011011100010001001100),
.pxl_out(pxl_out_261), .valid_out(valid_out_261) );

//Channel 262
conv_33 #(D, DATA_WIDTH) x262(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111110000011011100011000100000),
.kernel_01(32'b00111100110101000111101101110001),
.kernel_02(32'b10111101000110011111000010011010),
.kernel_03(32'b00111101111010111010111100110111),
.kernel_04(32'b10111110000110010111010100100110),
.kernel_05(32'b10111101110010001101001101100010),
.kernel_06(32'b10111101001011011111011110001101),
.kernel_07(32'b10111101111001011000100011000110),
.kernel_08(32'b10111101100100010001001011011101),
.pxl_out(pxl_out_262), .valid_out(valid_out_262) );

//Channel 263
conv_33 #(D, DATA_WIDTH) x263(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111101010100100001100001001111),
.kernel_01(32'b10111110100000000111000011100111),
.kernel_02(32'b10111110001101100001111111100011),
.kernel_03(32'b10111110001000000111001011101110),
.kernel_04(32'b10111101000010101100101000011001),
.kernel_05(32'b10111101110000000011010011100011),
.kernel_06(32'b10111101100001110110000100100010),
.kernel_07(32'b10111101001111111101101101110011),
.kernel_08(32'b00111100100011111010001101000001),
.pxl_out(pxl_out_263), .valid_out(valid_out_263) );

//Channel 264
conv_33 #(D, DATA_WIDTH) x264(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111100101000110101111101011001),
.kernel_01(32'b10111101100001111010101000111011),
.kernel_02(32'b10111100010111101100110111100101),
.kernel_03(32'b00111100001001010110101010010010),
.kernel_04(32'b00111101000111111111111111001001),
.kernel_05(32'b00111100011100101010000010110100),
.kernel_06(32'b10111101110011001111111101111110),
.kernel_07(32'b00111101100010001001010001101111),
.kernel_08(32'b10111100001001100110110101100001),
.pxl_out(pxl_out_264), .valid_out(valid_out_264) );

//Channel 265
conv_33 #(D, DATA_WIDTH) x265(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b00111101000111100011110010101000),
.kernel_01(32'b00111101001111011010000110101001),
.kernel_02(32'b10111101010011000100110111100101),
.kernel_03(32'b00111101000011011000000100101000),
.kernel_04(32'b00111101100101110000101000111001),
.kernel_05(32'b00111101100100000111010010101101),
.kernel_06(32'b10111110000010111010000110010011),
.kernel_07(32'b10111101011011001100001110101010),
.kernel_08(32'b00111101111111100011111001011010),
.pxl_out(pxl_out_265), .valid_out(valid_out_265) );

//Channel 266
conv_33 #(D, DATA_WIDTH) x266(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b10111100001000011001110010000010),
.kernel_01(32'b00111100001100010000011010101011),
.kernel_02(32'b10111100011100010000001111001011),
.kernel_03(32'b10111101010001000001110100111100),
.kernel_04(32'b10111100101011110001111100110011),
.kernel_05(32'b00111101101011110011000010101000),
.kernel_06(32'b00111100110010001000011000010010),
.kernel_07(32'b10111100111101000100000110110000),
.kernel_08(32'b10111100110111101011111011010000),
.pxl_out(pxl_out_266), .valid_out(valid_out_266) );

//Channel 267
conv_33 #(D, DATA_WIDTH) x267(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111101100011000010011101010100),
.kernel_01(32'b00111110000110101010010001011010),
.kernel_02(32'b00111100010111101110100111000100),
.kernel_03(32'b10111101000010100111101100111010),
.kernel_04(32'b00111010110100011011001000001110),
.kernel_05(32'b10111101100101111001010010011011),
.kernel_06(32'b00111110000111000111001011011110),
.kernel_07(32'b10111101100000110001110000101011),
.kernel_08(32'b10111101111000101001110000001100),
.pxl_out(pxl_out_267), .valid_out(valid_out_267) );

//Channel 268
conv_33 #(D, DATA_WIDTH) x268(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111101101111111001111000000001),
.kernel_01(32'b00111100110011010110000110111100),
.kernel_02(32'b10111111011000100010011110011000),
.kernel_03(32'b00111100100011110001001111010000),
.kernel_04(32'b00111101101100100011100010110100),
.kernel_05(32'b00111100011011110000100011101001),
.kernel_06(32'b00111100110011110110001010100101),
.kernel_07(32'b00111011011010010001010011001111),
.kernel_08(32'b00111110001100000111000010011011),
.pxl_out(pxl_out_268), .valid_out(valid_out_268) );

//Channel 269
conv_33 #(D, DATA_WIDTH) x269(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111101110010010100010000110010),
.kernel_01(32'b10111110001100110110010101100110),
.kernel_02(32'b00111110110110000111001010100111),
.kernel_03(32'b00111100110100100111111111100110),
.kernel_04(32'b00111101001001010000001001100111),
.kernel_05(32'b10111110000110010100101011000101),
.kernel_06(32'b00111011110010000001000110001001),
.kernel_07(32'b00111101111011111000000001000101),
.kernel_08(32'b00111101001011001111010101101000),
.pxl_out(pxl_out_269), .valid_out(valid_out_269) );

//Channel 270
conv_33 #(D, DATA_WIDTH) x270(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111101101011110000001011011110),
.kernel_01(32'b10111100101101110010111001101101),
.kernel_02(32'b00111101001000001101111011001101),
.kernel_03(32'b10111101100100111111100110111011),
.kernel_04(32'b10111110001101111101101001000111),
.kernel_05(32'b00111110100011010100011101001110),
.kernel_06(32'b00111101101110011111111000001010),
.kernel_07(32'b00111101111010000111000111001100),
.kernel_08(32'b10111101100001100101000110100001),
.pxl_out(pxl_out_270), .valid_out(valid_out_270) );

//Channel 271
conv_33 #(D, DATA_WIDTH) x271(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111110000100100010011000100101),
.kernel_01(32'b10111111000000000001100111011110),
.kernel_02(32'b00111101011101111110111000001100),
.kernel_03(32'b00111101001001000111000111111110),
.kernel_04(32'b00111011001011101111001110001100),
.kernel_05(32'b00111101010011101010101111110110),
.kernel_06(32'b10111101001100000000100110000010),
.kernel_07(32'b00111101001101000111100000110101),
.kernel_08(32'b00111101011100010000101010010110),
.pxl_out(pxl_out_271), .valid_out(valid_out_271) );

//Channel 272
conv_33 #(D, DATA_WIDTH) x272(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b00111101011001010001010111011000),
.kernel_01(32'b10111110000000100101110101010000),
.kernel_02(32'b10111101100101100001101110000011),
.kernel_03(32'b10111101000000000000000010100100),
.kernel_04(32'b00111100011001101100100010101111),
.kernel_05(32'b10111101010000001100001001110111),
.kernel_06(32'b10111110010010011001010001100000),
.kernel_07(32'b00111110000010111001111011101011),
.kernel_08(32'b10111100100101100110100100111011),
.pxl_out(pxl_out_272), .valid_out(valid_out_272) );

//Channel 273
conv_33 #(D, DATA_WIDTH) x273(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b00111101000110000010011011100001),
.kernel_01(32'b00111100100000101011111011101110),
.kernel_02(32'b10111101011101101011110101000011),
.kernel_03(32'b00111101011010000000010111010111),
.kernel_04(32'b10111101010101000000000100000011),
.kernel_05(32'b10111100110101101111101001100011),
.kernel_06(32'b10111011111001101111011010001010),
.kernel_07(32'b10111101111111011011011100101010),
.kernel_08(32'b00111101011011101010111111010100),
.pxl_out(pxl_out_273), .valid_out(valid_out_273) );

//Channel 274
conv_33 #(D, DATA_WIDTH) x274(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b00111101111011111100111100010111),
.kernel_01(32'b00111101000011010010111001101111),
.kernel_02(32'b00111110011010000001000010010111),
.kernel_03(32'b10111101101000100001001110010101),
.kernel_04(32'b00111101011001100001011100111111),
.kernel_05(32'b00111101101100000110110100100110),
.kernel_06(32'b00111100100001011101000010101010),
.kernel_07(32'b00111110100110001110110001100111),
.kernel_08(32'b00111110000011110011011000110110),
.pxl_out(pxl_out_274), .valid_out(valid_out_274) );

//Channel 275
conv_33 #(D, DATA_WIDTH) x275(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111101101100111101001100110000),
.kernel_01(32'b00111101000111010001001100100011),
.kernel_02(32'b10111100110100010101000010111010),
.kernel_03(32'b10111101100001100101110100101101),
.kernel_04(32'b00111110010100100011100010111110),
.kernel_05(32'b10111101000100100101011100001011),
.kernel_06(32'b10111110001010010100101101010100),
.kernel_07(32'b10111110010010011101011010011000),
.kernel_08(32'b00111110010111110001101110111001),
.pxl_out(pxl_out_275), .valid_out(valid_out_275) );

//Channel 276
conv_33 #(D, DATA_WIDTH) x276(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111110001110001001101101010110),
.kernel_01(32'b10111101111101111000111010001011),
.kernel_02(32'b10111110100000001101010100100101),
.kernel_03(32'b10111011010110110111110011001010),
.kernel_04(32'b10111101001110111011110100101011),
.kernel_05(32'b10111110001100101111110111001110),
.kernel_06(32'b00111100000111101110010111010101),
.kernel_07(32'b00111101110001101111110111011001),
.kernel_08(32'b00111101100001101010110011111110),
.pxl_out(pxl_out_276), .valid_out(valid_out_276) );

//Channel 277
conv_33 #(D, DATA_WIDTH) x277(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111101101100010111001110010001),
.kernel_01(32'b00111101000111101000011000000001),
.kernel_02(32'b00111110100000110111010110001001),
.kernel_03(32'b00111110000110111000001111100010),
.kernel_04(32'b10111110001010010000001111011011),
.kernel_05(32'b00111110100011000000101110001110),
.kernel_06(32'b00111101010010110001001010000101),
.kernel_07(32'b00111101100000100010100010000001),
.kernel_08(32'b00111100100000100100000110010100),
.pxl_out(pxl_out_277), .valid_out(valid_out_277) );

//Channel 278
conv_33 #(D, DATA_WIDTH) x278(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b00111101110000110101101001001001),
.kernel_01(32'b10111101010101000101110101000110),
.kernel_02(32'b00111101010111110101011001010000),
.kernel_03(32'b00111110000000001010001100100110),
.kernel_04(32'b00111100100101101011110101100101),
.kernel_05(32'b10111100110111111111110000000100),
.kernel_06(32'b00111100111000110101011000011011),
.kernel_07(32'b00111100001010101000100000101011),
.kernel_08(32'b10111110001001110000110011011110),
.pxl_out(pxl_out_278), .valid_out(valid_out_278) );

//Channel 279
conv_33 #(D, DATA_WIDTH) x279(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111011000010010000000111100011),
.kernel_01(32'b00111011011011100011111011111111),
.kernel_02(32'b10111100111110100011100001000000),
.kernel_03(32'b10111101011100110010101101001000),
.kernel_04(32'b00111101011110110111010111011011),
.kernel_05(32'b00111011111100011011111011100101),
.kernel_06(32'b10111100000111111101111110100001),
.kernel_07(32'b10111110000100110100010011000101),
.kernel_08(32'b00111100101010010111010101110000),
.pxl_out(pxl_out_279), .valid_out(valid_out_279) );

//Channel 280
conv_33 #(D, DATA_WIDTH) x280(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b10111101011110111000100001011000),
.kernel_01(32'b10111000000000010100111111101110),
.kernel_02(32'b10111110000001101000110001000010),
.kernel_03(32'b00111100011001001000101011101001),
.kernel_04(32'b00111100101011110010111101011001),
.kernel_05(32'b10111011000111000111100110001111),
.kernel_06(32'b00111101100101000001001110000001),
.kernel_07(32'b00111101100011001000110110101011),
.kernel_08(32'b00111101110001000011111011001100),
.pxl_out(pxl_out_280), .valid_out(valid_out_280) );

//Channel 281
conv_33 #(D, DATA_WIDTH) x281(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b10111011001001101011100110011110),
.kernel_01(32'b10111011001110110100101010110001),
.kernel_02(32'b00111101000000011101101110101110),
.kernel_03(32'b00111101100010110100100000010001),
.kernel_04(32'b10111101100000001101010100110001),
.kernel_05(32'b00111101010110001001001011011000),
.kernel_06(32'b00111110000011101111000100010111),
.kernel_07(32'b00111101001100100110010111001110),
.kernel_08(32'b10111110010111010011011110100100),
.pxl_out(pxl_out_281), .valid_out(valid_out_281) );

//Channel 282
conv_33 #(D, DATA_WIDTH) x282(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111100101100011000111010001011),
.kernel_01(32'b00111110001010000111000010100010),
.kernel_02(32'b00111011110001010111000101101000),
.kernel_03(32'b10111100000100101100110000000100),
.kernel_04(32'b00111010111110111011100000110101),
.kernel_05(32'b10111101110010001110010111010111),
.kernel_06(32'b10111100110001101000111101011000),
.kernel_07(32'b00111101011110001111101101100100),
.kernel_08(32'b10111010101110011100111111110110),
.pxl_out(pxl_out_282), .valid_out(valid_out_282) );

//Channel 283
conv_33 #(D, DATA_WIDTH) x283(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111100001001110111000010101010),
.kernel_01(32'b10111011000101000101100110101001),
.kernel_02(32'b00111100101111110100000110001100),
.kernel_03(32'b00111110010001111001111111001110),
.kernel_04(32'b10111101101111011010011101110000),
.kernel_05(32'b10111101101111100110010011001011),
.kernel_06(32'b00111101101010111101011001001010),
.kernel_07(32'b00111110011111110111100010001011),
.kernel_08(32'b00111101100100101011011101111100),
.pxl_out(pxl_out_283), .valid_out(valid_out_283) );

//Channel 284
conv_33 #(D, DATA_WIDTH) x284(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111101100000100101011110010100),
.kernel_01(32'b00111100101111010100110100100010),
.kernel_02(32'b00111101000111000001111011100110),
.kernel_03(32'b10111011101101001100101000111111),
.kernel_04(32'b10111101000010111111001011111001),
.kernel_05(32'b00111100001011011111000010111101),
.kernel_06(32'b10111101110100001110011010100110),
.kernel_07(32'b10111101010101111011011111100110),
.kernel_08(32'b10111101000000011001000111101111),
.pxl_out(pxl_out_284), .valid_out(valid_out_284) );

//Channel 285
conv_33 #(D, DATA_WIDTH) x285(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111110101111100010110000011010),
.kernel_01(32'b10111101110000011001011101000000),
.kernel_02(32'b10111110100000000001110110011010),
.kernel_03(32'b00111110000100110110101001001001),
.kernel_04(32'b00111011011101100000011010101001),
.kernel_05(32'b00111100111101010001111100101011),
.kernel_06(32'b10111101100111010100000000011100),
.kernel_07(32'b00111101010001011001001101100101),
.kernel_08(32'b00111101100011000010011000000111),
.pxl_out(pxl_out_285), .valid_out(valid_out_285) );

//Channel 286
conv_33 #(D, DATA_WIDTH) x286(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111111001111100001100111011101),
.kernel_01(32'b10111100011100010110101110100011),
.kernel_02(32'b00111100011100011110011101001011),
.kernel_03(32'b00111101100011111110011001110010),
.kernel_04(32'b10111100110001100010001011111110),
.kernel_05(32'b00111101000100110011010101000111),
.kernel_06(32'b00111101101100111011111011111010),
.kernel_07(32'b00111101101110001101001101101101),
.kernel_08(32'b00111100101111111110001000001100),
.pxl_out(pxl_out_286), .valid_out(valid_out_286) );

//Channel 287
conv_33 #(D, DATA_WIDTH) x287(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b00111110111100001010001111010100),
.kernel_01(32'b00111110010000010011011010111101),
.kernel_02(32'b00111100111000000111000110000101),
.kernel_03(32'b00111010101010000111011111000110),
.kernel_04(32'b00111101000000101101010101001100),
.kernel_05(32'b10111101101111010111101100110000),
.kernel_06(32'b00111101000100001100100110001100),
.kernel_07(32'b10111101110001110101100101001001),
.kernel_08(32'b00111100110101010101110000000010),
.pxl_out(pxl_out_287), .valid_out(valid_out_287) );

//Channel 288
conv_33 #(D, DATA_WIDTH) x288(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111101100100000001010001100011),
.kernel_01(32'b10111100101101010110000010010000),
.kernel_02(32'b10111110101011000100110001010111),
.kernel_03(32'b00111101111100000101111000111111),
.kernel_04(32'b00111100011011100000100111100101),
.kernel_05(32'b00111101101100001001001111101110),
.kernel_06(32'b10111110000011110001011000001001),
.kernel_07(32'b10111101001011110011100110101000),
.kernel_08(32'b00111101000101000111111001000110),
.pxl_out(pxl_out_288), .valid_out(valid_out_288) );

//Channel 289
conv_33 #(D, DATA_WIDTH) x289(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111110111110001100111111000101),
.kernel_01(32'b00111100111101001101001111100111),
.kernel_02(32'b10111011110111000111010001010001),
.kernel_03(32'b00111101101100010101110010010110),
.kernel_04(32'b10111100011111011000100110110110),
.kernel_05(32'b10111110001000011000011010100011),
.kernel_06(32'b00111110000101101000010000101111),
.kernel_07(32'b00111101001111101101111000010100),
.kernel_08(32'b10111100100111110001101010010000),
.pxl_out(pxl_out_289), .valid_out(valid_out_289) );

//Channel 290
conv_33 #(D, DATA_WIDTH) x290(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b00111110010111111101000000001101),
.kernel_01(32'b00111101101010010011001101110000),
.kernel_02(32'b10111101110010111101110100111011),
.kernel_03(32'b00111110100011110101101011110011),
.kernel_04(32'b10111110011111000101001111101001),
.kernel_05(32'b10111101010100010001011000111110),
.kernel_06(32'b00111101010010100000011010011110),
.kernel_07(32'b00111100101000110111101000110011),
.kernel_08(32'b10111100111101001110001010100101),
.pxl_out(pxl_out_290), .valid_out(valid_out_290) );

//Channel 291
conv_33 #(D, DATA_WIDTH) x291(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b10111011001011011001110111000001),
.kernel_01(32'b00111100001110111110100001111110),
.kernel_02(32'b00111100101001100000010100000100),
.kernel_03(32'b00111110001011001000000010111010),
.kernel_04(32'b10111110100100010100001010110110),
.kernel_05(32'b00111100000110100111110001001100),
.kernel_06(32'b00111101100010100010100010011111),
.kernel_07(32'b00111101000100000001011110111101),
.kernel_08(32'b10111110000100101001111100001100),
.pxl_out(pxl_out_291), .valid_out(valid_out_291) );

//Channel 292
conv_33 #(D, DATA_WIDTH) x292(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111110001010000101000100010110),
.kernel_01(32'b00111110010100011001000100011111),
.kernel_02(32'b10111110000010100011111110001111),
.kernel_03(32'b00111110011111100101100110101011),
.kernel_04(32'b00111100100110110111000000100110),
.kernel_05(32'b10111110001100010011000101001101),
.kernel_06(32'b10111101011001110100001111111011),
.kernel_07(32'b00111110000001111100010000111110),
.kernel_08(32'b00111100110011100101010101001110),
.pxl_out(pxl_out_292), .valid_out(valid_out_292) );

//Channel 293
conv_33 #(D, DATA_WIDTH) x293(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b10111100100000101000000011000101),
.kernel_01(32'b10111110100101001101011101011101),
.kernel_02(32'b10111110000010011010000001111000),
.kernel_03(32'b00111100101101001011011011001101),
.kernel_04(32'b00111100001010100010011000101001),
.kernel_05(32'b10111101010001000111111111000101),
.kernel_06(32'b00111101100110100000100001010011),
.kernel_07(32'b00111101000100001111111001011111),
.kernel_08(32'b00111100101000101101110010111001),
.pxl_out(pxl_out_293), .valid_out(valid_out_293) );

//Channel 294
conv_33 #(D, DATA_WIDTH) x294(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111110000010000000110011111000),
.kernel_01(32'b10111110001100100000101111010101),
.kernel_02(32'b10111110001000111100000100100100),
.kernel_03(32'b00111101011110100110100010110111),
.kernel_04(32'b00111110011001010000100111101010),
.kernel_05(32'b00111101100001101100011110011100),
.kernel_06(32'b10111011110010001111111010001011),
.kernel_07(32'b00111101100100000111010111011011),
.kernel_08(32'b00111110000001101101000101001111),
.pxl_out(pxl_out_294), .valid_out(valid_out_294) );

//Channel 295
conv_33 #(D, DATA_WIDTH) x295(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111100011000010010010011100101),
.kernel_01(32'b00111101001111001010001110011001),
.kernel_02(32'b10111100101010010011011001011101),
.kernel_03(32'b00111100101100001110000011011111),
.kernel_04(32'b00111110101111110100111000111001),
.kernel_05(32'b00111011100000010100011000000001),
.kernel_06(32'b00111110101000100000000101001001),
.kernel_07(32'b10111110000011011101011111101110),
.kernel_08(32'b10111110011000111010001110100000),
.pxl_out(pxl_out_295), .valid_out(valid_out_295) );

//Channel 296
conv_33 #(D, DATA_WIDTH) x296(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111100110000101110000000111110),
.kernel_01(32'b00111110010001000000010011100111),
.kernel_02(32'b00111101100001111101010001001110),
.kernel_03(32'b10111101100110101011001001110010),
.kernel_04(32'b10111101001100010100110010001111),
.kernel_05(32'b10111110000101001101010101101000),
.kernel_06(32'b10111101010011101101011100100100),
.kernel_07(32'b10111101010100101100010001001100),
.kernel_08(32'b00111101010000110001010000001000),
.pxl_out(pxl_out_296), .valid_out(valid_out_296) );

//Channel 297
conv_33 #(D, DATA_WIDTH) x297(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111110001001110011111000101111),
.kernel_01(32'b10111101110111001101001000001100),
.kernel_02(32'b00111101101111001010101011011101),
.kernel_03(32'b00111101000000011110001000110001),
.kernel_04(32'b00111100010110110010100100000100),
.kernel_05(32'b10111110011011100100010100100010),
.kernel_06(32'b10111100101011010110110100111110),
.kernel_07(32'b10111100100010011011001100000110),
.kernel_08(32'b10111100101100101111101100001000),
.pxl_out(pxl_out_297), .valid_out(valid_out_297) );

//Channel 298
conv_33 #(D, DATA_WIDTH) x298(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b10111110001010101110111101100110),
.kernel_01(32'b00111101011100001011010111001000),
.kernel_02(32'b00111101000000001111110000010001),
.kernel_03(32'b10111101101001110011101100101000),
.kernel_04(32'b10111101100101110100001010001010),
.kernel_05(32'b00111101000111110111111111010001),
.kernel_06(32'b10111101111110010110111011011000),
.kernel_07(32'b00111101001000110100110001000101),
.kernel_08(32'b10111100011011001011001001000000),
.pxl_out(pxl_out_298), .valid_out(valid_out_298) );

//Channel 299
conv_33 #(D, DATA_WIDTH) x299(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b00111101110000111111101110101001),
.kernel_01(32'b10111011100110110101100100000111),
.kernel_02(32'b10111101111000010001010010001110),
.kernel_03(32'b00111101000001110101000001111111),
.kernel_04(32'b00111110001001101101111110010100),
.kernel_05(32'b10110101111010110110111100010010),
.kernel_06(32'b00111101111100110000001111001010),
.kernel_07(32'b00111100010011101010000100000001),
.kernel_08(32'b10111101110101110101100000101111),
.pxl_out(pxl_out_299), .valid_out(valid_out_299) );

//Channel 300
conv_33 #(D, DATA_WIDTH) x300(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111100111100000110001110110011),
.kernel_01(32'b10111101010111011111011011101010),
.kernel_02(32'b10111110000100101000111111111111),
.kernel_03(32'b10111101000000111010111000110010),
.kernel_04(32'b10111101110101110011000000010101),
.kernel_05(32'b10111100111101101001111111000010),
.kernel_06(32'b10111101010000100101110001010110),
.kernel_07(32'b00111101000100110011000101010111),
.kernel_08(32'b00111100110011001001001100100000),
.pxl_out(pxl_out_300), .valid_out(valid_out_300) );

//Channel 301
conv_33 #(D, DATA_WIDTH) x301(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111011110101001001101111111010),
.kernel_01(32'b10111110000111100100010010011010),
.kernel_02(32'b10111101110110000011000110110000),
.kernel_03(32'b00111100010000101111100111010000),
.kernel_04(32'b10111001100011000100100110000110),
.kernel_05(32'b10111110000101010000001110001110),
.kernel_06(32'b10111011101011001110111010100111),
.kernel_07(32'b00111100011010100100111001111110),
.kernel_08(32'b10111100101010000010011011001011),
.pxl_out(pxl_out_301), .valid_out(valid_out_301) );

//Channel 302
conv_33 #(D, DATA_WIDTH) x302(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b10111011100000010011010100000000),
.kernel_01(32'b00111100100011010001110000001101),
.kernel_02(32'b00111100100110001001110010110110),
.kernel_03(32'b00111100101010001100111100110101),
.kernel_04(32'b10111100010000110011110110101111),
.kernel_05(32'b00111110001110100000100101101010),
.kernel_06(32'b00111101001010101001001011100110),
.kernel_07(32'b10111100110011100101110100011000),
.kernel_08(32'b00111100100110111101010111001111),
.pxl_out(pxl_out_302), .valid_out(valid_out_302) );

//Channel 303
conv_33 #(D, DATA_WIDTH) x303(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111110000110001011001001000100),
.kernel_01(32'b10111101011000001100111011100011),
.kernel_02(32'b10111101000110101110000100000010),
.kernel_03(32'b10111110000001011100101001000011),
.kernel_04(32'b10111101101000010111100100000100),
.kernel_05(32'b00111110000000000101110101100111),
.kernel_06(32'b00111100100000100101100001000001),
.kernel_07(32'b10111101000001001011111100111001),
.kernel_08(32'b10111110010010001000101000011010),
.pxl_out(pxl_out_303), .valid_out(valid_out_303) );

//Channel 304
conv_33 #(D, DATA_WIDTH) x304(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111101010110001100110010100100),
.kernel_01(32'b00111101011100010011011011110100),
.kernel_02(32'b10111110000010010101111100010100),
.kernel_03(32'b10111101100101010101100111010001),
.kernel_04(32'b00111110011111100001011110101101),
.kernel_05(32'b00111100110001111110000101100010),
.kernel_06(32'b00111101100111001011000110001010),
.kernel_07(32'b10111100111010110011110001101011),
.kernel_08(32'b10111100001001011010011001001011),
.pxl_out(pxl_out_304), .valid_out(valid_out_304) );

//Channel 305
conv_33 #(D, DATA_WIDTH) x305(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b00111110010110010010011100110101),
.kernel_01(32'b10111110100101111010001000001111),
.kernel_02(32'b00111100010111101111001001110001),
.kernel_03(32'b00111101001101101101111100111011),
.kernel_04(32'b10111100100000010010001010000001),
.kernel_05(32'b00111011100100101011100100100011),
.kernel_06(32'b10111101010010111011010000001011),
.kernel_07(32'b10111110000100010101100001000001),
.kernel_08(32'b00111110010011000010010111011000),
.pxl_out(pxl_out_305), .valid_out(valid_out_305) );

//Channel 306
conv_33 #(D, DATA_WIDTH) x306(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b00111100101001111110111010110100),
.kernel_01(32'b10111101011111010010110000110010),
.kernel_02(32'b10111110000000011111100001010110),
.kernel_03(32'b10111101100001001111111011110111),
.kernel_04(32'b10111101101000101001111111001100),
.kernel_05(32'b00111110101010101110011101011111),
.kernel_06(32'b10111101001001010010111110101101),
.kernel_07(32'b10111101111100010001101000000001),
.kernel_08(32'b10111101001010111100001000001011),
.pxl_out(pxl_out_306), .valid_out(valid_out_306) );

//Channel 307
conv_33 #(D, DATA_WIDTH) x307(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111100100000000101110011011111),
.kernel_01(32'b00111101001000101111111101000110),
.kernel_02(32'b00111100000000101001000101011000),
.kernel_03(32'b00111110001000001010011011000110),
.kernel_04(32'b10111100011000001100111110000100),
.kernel_05(32'b00111110000001001000101010001010),
.kernel_06(32'b00111101101110110011001111111011),
.kernel_07(32'b00111100101100110101000101000001),
.kernel_08(32'b00111100100111000110111101100010),
.pxl_out(pxl_out_307), .valid_out(valid_out_307) );

//Channel 308
conv_33 #(D, DATA_WIDTH) x308(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111101001011111101100000111110),
.kernel_01(32'b10111101000000111010000000011001),
.kernel_02(32'b00111110000101000011010111001100),
.kernel_03(32'b00111110010001110001111110101101),
.kernel_04(32'b10111110001001110011100010011101),
.kernel_05(32'b10111100101100000010001101011111),
.kernel_06(32'b00111110001000001000000011011011),
.kernel_07(32'b00111101000100100011011010010100),
.kernel_08(32'b10111110010100000111000100001011),
.pxl_out(pxl_out_308), .valid_out(valid_out_308) );

//Channel 309
conv_33 #(D, DATA_WIDTH) x309(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111101010100110100000110001101),
.kernel_01(32'b10111011101100100010001110011100),
.kernel_02(32'b00111011001000011101110101011110),
.kernel_03(32'b10111011000110010111010101100111),
.kernel_04(32'b10111101101011011011001110100101),
.kernel_05(32'b10111011101010000000001010000010),
.kernel_06(32'b10111110111001001001100101111001),
.kernel_07(32'b10111011110100101110011100010000),
.kernel_08(32'b00111101101001100100010000101010),
.pxl_out(pxl_out_309), .valid_out(valid_out_309) );

//Channel 310
conv_33 #(D, DATA_WIDTH) x310(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111101101010010100110010111111),
.kernel_01(32'b10111110000101011001111001011111),
.kernel_02(32'b00111101101000111111100001011010),
.kernel_03(32'b10111101101000100011100010111011),
.kernel_04(32'b10111101001111000110000010101100),
.kernel_05(32'b10111101001110000111010110111010),
.kernel_06(32'b10111011101110101010010110111110),
.kernel_07(32'b10111100010011011110000100111011),
.kernel_08(32'b10111101001110100101100111000111),
.pxl_out(pxl_out_310), .valid_out(valid_out_310) );

//Channel 311
conv_33 #(D, DATA_WIDTH) x311(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111110000001110001011011101000),
.kernel_01(32'b10111101000111010010001110001111),
.kernel_02(32'b10111101010111100010010110011000),
.kernel_03(32'b10111101101111100111010011101000),
.kernel_04(32'b00111101111101011000011011010110),
.kernel_05(32'b00111011110000100111000111101000),
.kernel_06(32'b00111100010001000101000000011001),
.kernel_07(32'b00111110000100101010010001100011),
.kernel_08(32'b10111110001110110010100100101000),
.pxl_out(pxl_out_311), .valid_out(valid_out_311) );

//Channel 312
conv_33 #(D, DATA_WIDTH) x312(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111100000100010011001100010100),
.kernel_01(32'b10111100110001001101101101111100),
.kernel_02(32'b00111101110110110011010101100110),
.kernel_03(32'b10111101110100001000011111111001),
.kernel_04(32'b10111101101011001010010001011011),
.kernel_05(32'b10111101101010100010100010011100),
.kernel_06(32'b00111100100011010101110100111111),
.kernel_07(32'b00111101101101110110000010001100),
.kernel_08(32'b10111100010000111000000111111100),
.pxl_out(pxl_out_312), .valid_out(valid_out_312) );

//Channel 313
conv_33 #(D, DATA_WIDTH) x313(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111100000110111010101101101000),
.kernel_01(32'b00111101100110011001010101100011),
.kernel_02(32'b10111100011111011010111011000001),
.kernel_03(32'b00111101100000000100110100000110),
.kernel_04(32'b10111011101010111110110001010010),
.kernel_05(32'b00111101101001100111000100110000),
.kernel_06(32'b10111110010100011101110001001011),
.kernel_07(32'b00111100011010101110000011001011),
.kernel_08(32'b00111110001010000101001111010011),
.pxl_out(pxl_out_313), .valid_out(valid_out_313) );

//Channel 314
conv_33 #(D, DATA_WIDTH) x314(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b00111100111110000111010110111001),
.kernel_01(32'b10111110111011110001001110110100),
.kernel_02(32'b10111101110111101010011010001111),
.kernel_03(32'b00111100110100001110001100011001),
.kernel_04(32'b10111101110011001101110110111110),
.kernel_05(32'b10111011011100001000001110010101),
.kernel_06(32'b00111100110111111110011011101000),
.kernel_07(32'b10111110001111101001111111001100),
.kernel_08(32'b10111101100000011001001010011111),
.pxl_out(pxl_out_314), .valid_out(valid_out_314) );

//Channel 315
conv_33 #(D, DATA_WIDTH) x315(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111101100010010110101100010100),
.kernel_01(32'b00111110101100101011110000100111),
.kernel_02(32'b10111101111111000100101100001001),
.kernel_03(32'b10111011010011000110111011100111),
.kernel_04(32'b10111101110010010001010010010011),
.kernel_05(32'b10111100111101000000100100011011),
.kernel_06(32'b00111101101011000000110100110110),
.kernel_07(32'b10111110101011100111110110101001),
.kernel_08(32'b10111101100010001101100110011110),
.pxl_out(pxl_out_315), .valid_out(valid_out_315) );

//Channel 316
conv_33 #(D, DATA_WIDTH) x316(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111101100001000110011110010001),
.kernel_01(32'b00111101111110011010001010110010),
.kernel_02(32'b00111110001100010001000101111111),
.kernel_03(32'b00111110001011001001010100010000),
.kernel_04(32'b00111101001111100100001010011110),
.kernel_05(32'b00111101101000001100111010001001),
.kernel_06(32'b00111101010100111111001100010000),
.kernel_07(32'b10111101111000101101001000100100),
.kernel_08(32'b00111011111101111111001110000101),
.pxl_out(pxl_out_316), .valid_out(valid_out_316) );

//Channel 317
conv_33 #(D, DATA_WIDTH) x317(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111110000100101011010001110110),
.kernel_01(32'b10111101111110111011100101111110),
.kernel_02(32'b00111110111001001110010000110001),
.kernel_03(32'b00111100001101010000001001000011),
.kernel_04(32'b00111110100000101101111101000010),
.kernel_05(32'b10111011001011101110011001110001),
.kernel_06(32'b10111101110100010101111001111010),
.kernel_07(32'b00111110000010101100001010011100),
.kernel_08(32'b10111001001010000000000000011001),
.pxl_out(pxl_out_317), .valid_out(valid_out_317) );

//Channel 318
conv_33 #(D, DATA_WIDTH) x318(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111101101011000101011111111111),
.kernel_01(32'b10111101100110110110110011111001),
.kernel_02(32'b10111110101111101100100011101011),
.kernel_03(32'b00111101100010011100001000001100),
.kernel_04(32'b10111101100110111011100111101000),
.kernel_05(32'b00111101100011011101100000001101),
.kernel_06(32'b00111101110000101101101100010011),
.kernel_07(32'b00111101010101011110010001001110),
.kernel_08(32'b10111110101110101010000111100101),
.pxl_out(pxl_out_318), .valid_out(valid_out_318) );

//Channel 319
conv_33 #(D, DATA_WIDTH) x319(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111111000001000011000001011000),
.kernel_01(32'b10111100011000011110001010111001),
.kernel_02(32'b00111100001110111101000111101001),
.kernel_03(32'b10111110101011001100101100100100),
.kernel_04(32'b10111011101010001010011001100100),
.kernel_05(32'b00111110010100110001110010100101),
.kernel_06(32'b10111011011100001001010101000100),
.kernel_07(32'b00111110001011111010000110010110),
.kernel_08(32'b10111101000101111101110001111010),
.pxl_out(pxl_out_319), .valid_out(valid_out_319) );

//Channel 320
conv_33 #(D, DATA_WIDTH) x320(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111100110110000001101000010111),
.kernel_01(32'b10111101100101001100010111011001),
.kernel_02(32'b00111101111100000001110101101111),
.kernel_03(32'b00111111000011111010101010101100),
.kernel_04(32'b00111101100100000100010111111110),
.kernel_05(32'b10111101111011010000011100010011),
.kernel_06(32'b10111110011000110001000010010001),
.kernel_07(32'b00111110101100011110001011010011),
.kernel_08(32'b00111110010110001111110011001000),
.pxl_out(pxl_out_320), .valid_out(valid_out_320) );

//Channel 321
conv_33 #(D, DATA_WIDTH) x321(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111111001100110010010111011010),
.kernel_01(32'b00111101011011001110101010100100),
.kernel_02(32'b10111110100010100010000001011011),
.kernel_03(32'b00111101101100001001110001010110),
.kernel_04(32'b10111101011011111111111101101000),
.kernel_05(32'b00111100110111111000110111111111),
.kernel_06(32'b10111100111011110100111001011111),
.kernel_07(32'b10111100101001100011110110000011),
.kernel_08(32'b10111101111110010001100010000011),
.pxl_out(pxl_out_321), .valid_out(valid_out_321) );

//Channel 322
conv_33 #(D, DATA_WIDTH) x322(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111110000011110011001111100000),
.kernel_01(32'b00111101101010011100110111100001),
.kernel_02(32'b00111101100010100000100111100100),
.kernel_03(32'b10111101010101111000010011101100),
.kernel_04(32'b10111111000101011101000111110011),
.kernel_05(32'b00111101100000010101100001001011),
.kernel_06(32'b10111101000001101111011010000010),
.kernel_07(32'b10111100101000010000011100100000),
.kernel_08(32'b10111111100111111100110101101000),
.pxl_out(pxl_out_322), .valid_out(valid_out_322) );

//Channel 323
conv_33 #(D, DATA_WIDTH) x323(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b10111100101110010100001001000100),
.kernel_01(32'b00111101001001011101110011001010),
.kernel_02(32'b00111110000101110111011101100111),
.kernel_03(32'b00111101100111101011001011101001),
.kernel_04(32'b10111101100101110100011111101110),
.kernel_05(32'b10111101001001010111010010110100),
.kernel_06(32'b10111101001010101111111001100011),
.kernel_07(32'b00111011110111010000111011000001),
.kernel_08(32'b00111110001000011011011101001010),
.pxl_out(pxl_out_323), .valid_out(valid_out_323) );

//Channel 324
conv_33 #(D, DATA_WIDTH) x324(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b10111110010010100001100001010011),
.kernel_01(32'b10111110000100101000011001011011),
.kernel_02(32'b00111101111101000100110110100011),
.kernel_03(32'b00111111101000110100010110000000),
.kernel_04(32'b10111101010111000101010100110000),
.kernel_05(32'b10111111001001001110110100101011),
.kernel_06(32'b10111101000011100101100010111101),
.kernel_07(32'b00111110100001011011110010010101),
.kernel_08(32'b00111011000110101011101111110100),
.pxl_out(pxl_out_324), .valid_out(valid_out_324) );

//Channel 325
conv_33 #(D, DATA_WIDTH) x325(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111100011110000101111011110100),
.kernel_01(32'b10111110001010001110000110011011),
.kernel_02(32'b10111101000110001101000101001000),
.kernel_03(32'b10111101101000011101111011011011),
.kernel_04(32'b00111100111011011101111110011111),
.kernel_05(32'b00111101001110011001011001011011),
.kernel_06(32'b00111101000011000001000111010110),
.kernel_07(32'b00111100111001001101001011101001),
.kernel_08(32'b00111101101001111111101100010010),
.pxl_out(pxl_out_325), .valid_out(valid_out_325) );

//Channel 326
conv_33 #(D, DATA_WIDTH) x326(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111110111111100010111110100001),
.kernel_01(32'b10111110110000001100011111110101),
.kernel_02(32'b00111110001000110011111001001101),
.kernel_03(32'b00111101101000111001001010100001),
.kernel_04(32'b00111111001010001000111010000001),
.kernel_05(32'b00111101000000011010000001100011),
.kernel_06(32'b00111101100111111001111010111000),
.kernel_07(32'b00111100000101100110011100101001),
.kernel_08(32'b10111100000001101111001101101011),
.pxl_out(pxl_out_326), .valid_out(valid_out_326) );

//Channel 327
conv_33 #(D, DATA_WIDTH) x327(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111100101100011110000010110100),
.kernel_01(32'b00111100010101110000111000110000),
.kernel_02(32'b00111100100100000001100110000111),
.kernel_03(32'b00111101010000100000100011111011),
.kernel_04(32'b00111110101000100101001101000010),
.kernel_05(32'b10111100100000010010011100001000),
.kernel_06(32'b00111110101011101110110011110000),
.kernel_07(32'b10111110111010001011101111110011),
.kernel_08(32'b10111111001010000111101011111000),
.pxl_out(pxl_out_327), .valid_out(valid_out_327) );

//Channel 328
conv_33 #(D, DATA_WIDTH) x328(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111101000011101100100010011000),
.kernel_01(32'b00111110110001110110111001010111),
.kernel_02(32'b10111101011101001111010010101100),
.kernel_03(32'b10111011010100100001111100000101),
.kernel_04(32'b10111101101000010101011111100101),
.kernel_05(32'b00111100010011111100100100010101),
.kernel_06(32'b00111110011111111010010011101100),
.kernel_07(32'b10111111001010111100110001001111),
.kernel_08(32'b00111100111010110100100010111100),
.pxl_out(pxl_out_328), .valid_out(valid_out_328) );

//Channel 329
conv_33 #(D, DATA_WIDTH) x329(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111011100101001101001011101101),
.kernel_01(32'b10111110100101011011001000011101),
.kernel_02(32'b10111011001000001111110001110000),
.kernel_03(32'b00111101000011000111011110101101),
.kernel_04(32'b00111110101010111100000101010010),
.kernel_05(32'b10111110010100000110110011010110),
.kernel_06(32'b00111110010001101101110011001011),
.kernel_07(32'b00111101001110010110111000001011),
.kernel_08(32'b00111101101011110110111110001001),
.pxl_out(pxl_out_329), .valid_out(valid_out_329) );

//Channel 330
conv_33 #(D, DATA_WIDTH) x330(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111110011111100000111110000001),
.kernel_01(32'b00111101000100100010101100001010),
.kernel_02(32'b10111100100010101101100110000101),
.kernel_03(32'b10111101101101100110000001100011),
.kernel_04(32'b00111101000101100010100001010010),
.kernel_05(32'b10111110010000101001011101111100),
.kernel_06(32'b10111110000001111100001011000101),
.kernel_07(32'b00111100110110011111001111011101),
.kernel_08(32'b00111101010000010100101010110101),
.pxl_out(pxl_out_330), .valid_out(valid_out_330) );

//Channel 331
conv_33 #(D, DATA_WIDTH) x331(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b00111110001101000010101110011110),
.kernel_01(32'b10111110011110111001101001111001),
.kernel_02(32'b10111110101101111000001010101101),
.kernel_03(32'b10111101110000001110001110110110),
.kernel_04(32'b10111110000111100111011101011001),
.kernel_05(32'b10111101100011011100010111011100),
.kernel_06(32'b00111111100001100000010001011110),
.kernel_07(32'b00111101110101011000000100010111),
.kernel_08(32'b10111110001101000011111100101101),
.pxl_out(pxl_out_331), .valid_out(valid_out_331) );

//Channel 332
conv_33 #(D, DATA_WIDTH) x332(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b10111101110000011100101110101011),
.kernel_01(32'b00111101010100111100010010001011),
.kernel_02(32'b00111101100101100101010010100011),
.kernel_03(32'b10111110100001100100111100100000),
.kernel_04(32'b10111100000000000100011000011101),
.kernel_05(32'b10111101001101011101110110010001),
.kernel_06(32'b10111110101000110010111111101101),
.kernel_07(32'b00111100011111100111000100110000),
.kernel_08(32'b10111011100011100001101111011101),
.pxl_out(pxl_out_332), .valid_out(valid_out_332) );

//Channel 333
conv_33 #(D, DATA_WIDTH) x333(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111011101100111011001011010010),
.kernel_01(32'b10111111100000100011010101100111),
.kernel_02(32'b00111110000011100000111011100001),
.kernel_03(32'b00111101000011001011101000000001),
.kernel_04(32'b10111101101110001001010111101010),
.kernel_05(32'b10111111010010100110000111101010),
.kernel_06(32'b10111100001111001000001101000010),
.kernel_07(32'b00111101100010001010000100100001),
.kernel_08(32'b10111101110000000001101011100111),
.pxl_out(pxl_out_333), .valid_out(valid_out_333) );

//Channel 334
conv_33 #(D, DATA_WIDTH) x334(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111101111010110000010101011101),
.kernel_01(32'b00111100111110001001010100001101),
.kernel_02(32'b10111110001111000100101010111011),
.kernel_03(32'b00111100101100110000101110110101),
.kernel_04(32'b10111011100101111110101100011010),
.kernel_05(32'b00111110011000101111110001000010),
.kernel_06(32'b00111100011010101101000011110000),
.kernel_07(32'b10111101110000011011111011000110),
.kernel_08(32'b00111110010101101101111010111101),
.pxl_out(pxl_out_334), .valid_out(valid_out_334) );

//Channel 335
conv_33 #(D, DATA_WIDTH) x335(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111111010001111000011111001001),
.kernel_01(32'b00111101100111001000111110010010),
.kernel_02(32'b00111110000111100011100001010101),
.kernel_03(32'b10111101111001110101010001110110),
.kernel_04(32'b00111101110100001111110001011011),
.kernel_05(32'b00111100101110000010011110010111),
.kernel_06(32'b00111100010110010110011000100001),
.kernel_07(32'b10111101100011101001100110011110),
.kernel_08(32'b00111110100001100111001010100110),
.pxl_out(pxl_out_335), .valid_out(valid_out_335) );

//Channel 336
conv_33 #(D, DATA_WIDTH) x336(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111010011111111101001110100110),
.kernel_01(32'b00111010111101011111101010001011),
.kernel_02(32'b00111110000100110001111000011100),
.kernel_03(32'b00111110000111100111110000010110),
.kernel_04(32'b00111101011010101000111101010011),
.kernel_05(32'b00111101101101110001110011001010),
.kernel_06(32'b10111101001101101011111100000110),
.kernel_07(32'b10111101010001010010001010000011),
.kernel_08(32'b10111101001110001000000011010111),
.pxl_out(pxl_out_336), .valid_out(valid_out_336) );

//Channel 337
conv_33 #(D, DATA_WIDTH) x337(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111101010000010000010100111001),
.kernel_01(32'b00111100011001111001101000101110),
.kernel_02(32'b10111011001100111100101111000110),
.kernel_03(32'b00111101001101001000110010011010),
.kernel_04(32'b10111110001110000000011110010000),
.kernel_05(32'b00111101100100100111101110011101),
.kernel_06(32'b10111110001101001011000111010110),
.kernel_07(32'b00111101111101110001000100110110),
.kernel_08(32'b00111011001000011011001000110011),
.pxl_out(pxl_out_337), .valid_out(valid_out_337) );

//Channel 338
conv_33 #(D, DATA_WIDTH) x338(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111101111110100000110011000111),
.kernel_01(32'b10111101110111011000111100100100),
.kernel_02(32'b10111110000010111010101101010010),
.kernel_03(32'b00111101000100010110100001111011),
.kernel_04(32'b00111011100101101111101101001000),
.kernel_05(32'b00111101100001101100001100000001),
.kernel_06(32'b00111100101000001100110001101011),
.kernel_07(32'b10111110101111101110111010101100),
.kernel_08(32'b10111110010001000101001100101100),
.pxl_out(pxl_out_338), .valid_out(valid_out_338) );

//Channel 339
conv_33 #(D, DATA_WIDTH) x339(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111101101011001000010010000001),
.kernel_01(32'b10111101001110111111000000101100),
.kernel_02(32'b10111100111100000110100011110010),
.kernel_03(32'b00111101100101001010101010000111),
.kernel_04(32'b10111101110101111010110100111100),
.kernel_05(32'b00111101011010111110011100100101),
.kernel_06(32'b00111001101101011101111011111010),
.kernel_07(32'b00111101111000110000111100011001),
.kernel_08(32'b00111011000110000001100111100101),
.pxl_out(pxl_out_339), .valid_out(valid_out_339) );

//Channel 340
conv_33 #(D, DATA_WIDTH) x340(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111011010100000101001001001100),
.kernel_01(32'b10111110000001110100100011010010),
.kernel_02(32'b00111110101011100111110110000111),
.kernel_03(32'b00111110001101101100111001110110),
.kernel_04(32'b10111110000001010111011001111010),
.kernel_05(32'b00111110000000000011000011101110),
.kernel_06(32'b00111110111111111110101100110111),
.kernel_07(32'b00111101110101011101000011000011),
.kernel_08(32'b10111101000100011001001011000010),
.pxl_out(pxl_out_340), .valid_out(valid_out_340) );

//Channel 341
conv_33 #(D, DATA_WIDTH) x341(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111101110011100001100100101111),
.kernel_01(32'b00111101111001010110110110011000),
.kernel_02(32'b10111100101000010101100111001100),
.kernel_03(32'b00111100100100011011011100111000),
.kernel_04(32'b10111100110010111001000110101011),
.kernel_05(32'b00111101110001000000010000011000),
.kernel_06(32'b10111110111001101000110100101100),
.kernel_07(32'b10111101101010110010101010011011),
.kernel_08(32'b00111111000100001101011001011110),
.pxl_out(pxl_out_341), .valid_out(valid_out_341) );

//Channel 342
conv_33 #(D, DATA_WIDTH) x342(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111101101001101111011011110000),
.kernel_01(32'b10111110111000110100101001001001),
.kernel_02(32'b10111101111110001000101000110100),
.kernel_03(32'b10111101111100011111011101101000),
.kernel_04(32'b00111101010001110010101001000000),
.kernel_05(32'b00111011010001101011101000111010),
.kernel_06(32'b00111101001000010011100101001100),
.kernel_07(32'b00111101011011100001110000100100),
.kernel_08(32'b00111100110101010111001111011000),
.pxl_out(pxl_out_342), .valid_out(valid_out_342) );

//Channel 343
conv_33 #(D, DATA_WIDTH) x343(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111101110000000110011100110101),
.kernel_01(32'b00111100111000101000011001001001),
.kernel_02(32'b10111101010000101010011000111011),
.kernel_03(32'b00111101100001101011110110111001),
.kernel_04(32'b00111110000111010110100011000010),
.kernel_05(32'b00111100110101111111111011110100),
.kernel_06(32'b10111011110011101010001111011110),
.kernel_07(32'b00111110010001011000101000111100),
.kernel_08(32'b10111101011001111110110101111110),
.pxl_out(pxl_out_343), .valid_out(valid_out_343) );

//Channel 344
conv_33 #(D, DATA_WIDTH) x344(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b10111100001110001111010011111001),
.kernel_01(32'b00111100100100100100110010101110),
.kernel_02(32'b00111011111011110001111101111001),
.kernel_03(32'b00111101000111000000101001101000),
.kernel_04(32'b10111100100001000001010000011111),
.kernel_05(32'b00111101001110001111100110010000),
.kernel_06(32'b00111101010001111000010101100110),
.kernel_07(32'b10111101010111110101111001100011),
.kernel_08(32'b00111011100011110110000000111000),
.pxl_out(pxl_out_344), .valid_out(valid_out_344) );

//Channel 345
conv_33 #(D, DATA_WIDTH) x345(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b10111100111111001011001001011100),
.kernel_01(32'b10111011010101000010110100110010),
.kernel_02(32'b00111011110000000111000011110101),
.kernel_03(32'b00111100010101011011111010001111),
.kernel_04(32'b00111101010010101000001011110010),
.kernel_05(32'b10111101110011101111001111001000),
.kernel_06(32'b10111100110101000000110010000100),
.kernel_07(32'b00111100011111100110110110001010),
.kernel_08(32'b10111110000101011101101001100001),
.pxl_out(pxl_out_345), .valid_out(valid_out_345) );

//Channel 346
conv_33 #(D, DATA_WIDTH) x346(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111101000000111001101101110001),
.kernel_01(32'b00111101101000000111101100000101),
.kernel_02(32'b00111100101010110101011000010110),
.kernel_03(32'b00111111001100010111000111000110),
.kernel_04(32'b10111010111001010001001011110000),
.kernel_05(32'b00111101011111000111011100111101),
.kernel_06(32'b00111101110100110011110100011011),
.kernel_07(32'b10111101001100111001101000100110),
.kernel_08(32'b00111101010111101000001011100011),
.pxl_out(pxl_out_346), .valid_out(valid_out_346) );

//Channel 347
conv_33 #(D, DATA_WIDTH) x347(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111101010100010000001010101001),
.kernel_01(32'b00111100100110010010010001100001),
.kernel_02(32'b10111101000011000011010111110011),
.kernel_03(32'b00111110001101001111101010100101),
.kernel_04(32'b00111100011011100010110010111110),
.kernel_05(32'b10111100101011110000000011111011),
.kernel_06(32'b10111110100011010001010000101010),
.kernel_07(32'b10111010000111100101001001001001),
.kernel_08(32'b10111011101101100010101111100110),
.pxl_out(pxl_out_347), .valid_out(valid_out_347) );

//Channel 348
conv_33 #(D, DATA_WIDTH) x348(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111100011001100000000111101010),
.kernel_01(32'b00111101101111010101111101100011),
.kernel_02(32'b10111101100101010000001010010111),
.kernel_03(32'b00111100000110111000100100000000),
.kernel_04(32'b10111101100010110100001000110111),
.kernel_05(32'b00111101000101111101100010110100),
.kernel_06(32'b10111010010110110000001110010110),
.kernel_07(32'b00111101010011011000010000010000),
.kernel_08(32'b00111100101011010011101100100000),
.pxl_out(pxl_out_348), .valid_out(valid_out_348) );

//Channel 349
conv_33 #(D, DATA_WIDTH) x349(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111100010100000101010001011010),
.kernel_01(32'b00111011001011101101100001010110),
.kernel_02(32'b10111100010011011110011111101101),
.kernel_03(32'b00111101000101110000110000011111),
.kernel_04(32'b00111110010101011100101000101010),
.kernel_05(32'b00111101001001111100110001001010),
.kernel_06(32'b00111100101111100001111100010101),
.kernel_07(32'b10111101000110100010010111000000),
.kernel_08(32'b00111100111111011001011110000100),
.pxl_out(pxl_out_349), .valid_out(valid_out_349) );

//Channel 350
conv_33 #(D, DATA_WIDTH) x350(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b00111110000000111000100000010100),
.kernel_01(32'b10111100100010001010110111011010),
.kernel_02(32'b10111101010001101010101110110111),
.kernel_03(32'b00111100111111111011011110000110),
.kernel_04(32'b10111100111000000001110100100101),
.kernel_05(32'b10111101010010110000000010111010),
.kernel_06(32'b00111101101011000110000000011000),
.kernel_07(32'b00111101000110010110101000100101),
.kernel_08(32'b10111110011000110001111111111111),
.pxl_out(pxl_out_350), .valid_out(valid_out_350) );

//Channel 351
conv_33 #(D, DATA_WIDTH) x351(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111101100001000111011001011100),
.kernel_01(32'b10111101000011100101111011101101),
.kernel_02(32'b10111100101111010010001011110000),
.kernel_03(32'b10111010100000100001001011100001),
.kernel_04(32'b00111101110001110011011000110100),
.kernel_05(32'b10111101001010101101001111101001),
.kernel_06(32'b10111101010001000001100100100111),
.kernel_07(32'b00111110001100101111100111110010),
.kernel_08(32'b10111100110111101000001111100000),
.pxl_out(pxl_out_351), .valid_out(valid_out_351) );

//Channel 352
conv_33 #(D, DATA_WIDTH) x352(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b00111101000001000110101011000100),
.kernel_01(32'b00111101100010111011101111110011),
.kernel_02(32'b00111100011110010100110110010010),
.kernel_03(32'b10111100110010011000000111000100),
.kernel_04(32'b00111100111001101101111101010110),
.kernel_05(32'b10111101010110010100110000010011),
.kernel_06(32'b00111100100000010111001000010011),
.kernel_07(32'b00111101101100010110100010011010),
.kernel_08(32'b00111101100010010000001001010101),
.pxl_out(pxl_out_352), .valid_out(valid_out_352) );

//Channel 353
conv_33 #(D, DATA_WIDTH) x353(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111110010100010111101010110100),
.kernel_01(32'b00111101011010100000100111110001),
.kernel_02(32'b00111100100111110101111101001001),
.kernel_03(32'b10111101110000100111101101000101),
.kernel_04(32'b10111100110001100001010111000110),
.kernel_05(32'b00111110000101111101110010101101),
.kernel_06(32'b10111101010100111111001011000100),
.kernel_07(32'b10111100111100101010001100011110),
.kernel_08(32'b00111100001000100010100001111000),
.pxl_out(pxl_out_353), .valid_out(valid_out_353) );

//Channel 354
conv_33 #(D, DATA_WIDTH) x354(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111101101100111100001010100001),
.kernel_01(32'b10111110010110001100010011101101),
.kernel_02(32'b00111110000100010100101111010100),
.kernel_03(32'b10111101110101110101001100010000),
.kernel_04(32'b10111110101011001011000001110100),
.kernel_05(32'b10111010101011111010011111110001),
.kernel_06(32'b00111101011001111110100010010100),
.kernel_07(32'b10111110001110010101011000101111),
.kernel_08(32'b10111100100101100000110111111000),
.pxl_out(pxl_out_354), .valid_out(valid_out_354) );

//Channel 355
conv_33 #(D, DATA_WIDTH) x355(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111101101011010010011101001110),
.kernel_01(32'b00111101101110011011100010100010),
.kernel_02(32'b10111110000111101000100010001111),
.kernel_03(32'b00111101111111000111010001110010),
.kernel_04(32'b00111101010101101001100100100000),
.kernel_05(32'b00111101100110011101011001011100),
.kernel_06(32'b00111101110011100101111101101110),
.kernel_07(32'b00111101001010100100110000000101),
.kernel_08(32'b00111100001111000101001100001100),
.pxl_out(pxl_out_355), .valid_out(valid_out_355) );

//Channel 356
conv_33 #(D, DATA_WIDTH) x356(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111011100001001110010011111000),
.kernel_01(32'b10111101000001111110011100011011),
.kernel_02(32'b10111101010111000011100000101111),
.kernel_03(32'b00111101111010000000100111101100),
.kernel_04(32'b10111011110110011011110110000100),
.kernel_05(32'b10111101001000111011011000001011),
.kernel_06(32'b00111110101101111010010010000011),
.kernel_07(32'b00111011100001100101000011000111),
.kernel_08(32'b10111011100110010000100110110011),
.pxl_out(pxl_out_356), .valid_out(valid_out_356) );

//Channel 357
conv_33 #(D, DATA_WIDTH) x357(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b10111100111010110110101011100101),
.kernel_01(32'b10111101000001110001111010001111),
.kernel_02(32'b10111100100001110100111010110000),
.kernel_03(32'b10111110010000110111000011010100),
.kernel_04(32'b00111110000011010100001110101110),
.kernel_05(32'b10111101011101101101110001001011),
.kernel_06(32'b00111110010000110011001111010101),
.kernel_07(32'b10111101110011001101111011010111),
.kernel_08(32'b10111100101000111000101011011001),
.pxl_out(pxl_out_357), .valid_out(valid_out_357) );

//Channel 358
conv_33 #(D, DATA_WIDTH) x358(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111101011101010011101100001110),
.kernel_01(32'b00111101010100100111101110011010),
.kernel_02(32'b10111100111110100010110000011100),
.kernel_03(32'b00111101110011011010001110110101),
.kernel_04(32'b10111101111101100101111111110111),
.kernel_05(32'b00111110011010000001011000001101),
.kernel_06(32'b10111110011001111101011000100000),
.kernel_07(32'b10111101010001001011010010011110),
.kernel_08(32'b10111110001001011010100100011101),
.pxl_out(pxl_out_358), .valid_out(valid_out_358) );

//Channel 359
conv_33 #(D, DATA_WIDTH) x359(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111101101010110100010100110110),
.kernel_01(32'b00111101110010111000001101000011),
.kernel_02(32'b00111101101110011110011110111000),
.kernel_03(32'b00111110000101100111010010001011),
.kernel_04(32'b00111101011010110001100100110000),
.kernel_05(32'b10111101111100100001001110110101),
.kernel_06(32'b10111100100101111011100010100110),
.kernel_07(32'b10111101110111111010100111100001),
.kernel_08(32'b00111110000110101111010001101001),
.pxl_out(pxl_out_359), .valid_out(valid_out_359) );

//Channel 360
conv_33 #(D, DATA_WIDTH) x360(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b10111101101011011001001100011001),
.kernel_01(32'b10111101110001001000011001101000),
.kernel_02(32'b10111111001000011100000111110110),
.kernel_03(32'b00111100011111010000100100100010),
.kernel_04(32'b00111101110101000011001011001111),
.kernel_05(32'b00111011001101100001111110100001),
.kernel_06(32'b00111101001010111101110010000001),
.kernel_07(32'b10111101001100001011000001100100),
.kernel_08(32'b00111101110111011110100101110100),
.pxl_out(pxl_out_360), .valid_out(valid_out_360) );

//Channel 361
conv_33 #(D, DATA_WIDTH) x361(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111101100001101110011101110010),
.kernel_01(32'b00111101000101101001001110001111),
.kernel_02(32'b00111110100110001110001010000000),
.kernel_03(32'b10111100101000011011111000110001),
.kernel_04(32'b00111101110011011000000110101000),
.kernel_05(32'b00111110011000111001011110101100),
.kernel_06(32'b10111101011001100000100111011100),
.kernel_07(32'b10111101100100110111010111010110),
.kernel_08(32'b10111110110110011010000101011010),
.pxl_out(pxl_out_361), .valid_out(valid_out_361) );

//Channel 362
conv_33 #(D, DATA_WIDTH) x362(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111101110110100110101011010100),
.kernel_01(32'b10111011110100111000011000001101),
.kernel_02(32'b00111110000000000100000100100000),
.kernel_03(32'b00111101000011010011101111100011),
.kernel_04(32'b10111101111101111011000100101000),
.kernel_05(32'b10111110011011101100000110001101),
.kernel_06(32'b10111110101111110010111011000101),
.kernel_07(32'b00111100100110010110101011010011),
.kernel_08(32'b10111101100011001010000010101010),
.pxl_out(pxl_out_362), .valid_out(valid_out_362) );

//Channel 363
conv_33 #(D, DATA_WIDTH) x363(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b00111011111111011110100011010101),
.kernel_01(32'b00111100100011111101100011111101),
.kernel_02(32'b10111100110001010011011000101010),
.kernel_03(32'b10111110010110110110010001011001),
.kernel_04(32'b10111110000010011000111100101111),
.kernel_05(32'b00111011101111010000010101001101),
.kernel_06(32'b00111101110110011110001011110011),
.kernel_07(32'b10111110011000000101010011001100),
.kernel_08(32'b10111100111100110110101010001111),
.pxl_out(pxl_out_363), .valid_out(valid_out_363) );

//Channel 364
conv_33 #(D, DATA_WIDTH) x364(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111101100100001101001010010011),
.kernel_01(32'b00111101010100010001000110100001),
.kernel_02(32'b10111100001100001000000000101111),
.kernel_03(32'b10111101011011010000001111111011),
.kernel_04(32'b00111110001000101110011011000000),
.kernel_05(32'b10111010110111101101011000000000),
.kernel_06(32'b00111100100011110101010011010100),
.kernel_07(32'b00111101011010110000010000001011),
.kernel_08(32'b00111110101111001100111010010110),
.pxl_out(pxl_out_364), .valid_out(valid_out_364) );

//Channel 365
conv_33 #(D, DATA_WIDTH) x365(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b10111101100001011010010001101001),
.kernel_01(32'b00111101010101000100000101000110),
.kernel_02(32'b10111101110111110101110010000000),
.kernel_03(32'b10111100111101100100010010110010),
.kernel_04(32'b00111100111111000100101111110001),
.kernel_05(32'b10111101100000100001100010000011),
.kernel_06(32'b10111101000001000101000101000111),
.kernel_07(32'b10111110001101110001100101010010),
.kernel_08(32'b10111101100011000101110101010111),
.pxl_out(pxl_out_365), .valid_out(valid_out_365) );

//Channel 366
conv_33 #(D, DATA_WIDTH) x366(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b10111001111010001101111110101010),
.kernel_01(32'b10111101010010100100011001110011),
.kernel_02(32'b10111101000011000001110000010111),
.kernel_03(32'b00111101101111111111011011100010),
.kernel_04(32'b00111101101011000101100001101011),
.kernel_05(32'b10111101011110110010010110110110),
.kernel_06(32'b00111110001110110101011010111001),
.kernel_07(32'b10111100010100101001100001011110),
.kernel_08(32'b00111100110110011010111001100111),
.pxl_out(pxl_out_366), .valid_out(valid_out_366) );

//Channel 367
conv_33 #(D, DATA_WIDTH) x367(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111100001100010001000100001110),
.kernel_01(32'b00111101110010101100001100011110),
.kernel_02(32'b00111101110010010011000101010010),
.kernel_03(32'b00111110001010010111000001111111),
.kernel_04(32'b10111110001000100100111110000101),
.kernel_05(32'b10111110000100000111010000100111),
.kernel_06(32'b10111101001100000100000011000000),
.kernel_07(32'b00111110001011110101001010000010),
.kernel_08(32'b10111101101011110000011000111000),
.pxl_out(pxl_out_367), .valid_out(valid_out_367) );

//Channel 368
conv_33 #(D, DATA_WIDTH) x368(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111100111000100110011000011010),
.kernel_01(32'b00111100010000001111000011011101),
.kernel_02(32'b00111101101011110010001111110010),
.kernel_03(32'b00111100001000110110001111100110),
.kernel_04(32'b10111100110100011100000011110000),
.kernel_05(32'b10111110000011100111000010111100),
.kernel_06(32'b10111101101101011001100010100100),
.kernel_07(32'b00111101001001100011001011000001),
.kernel_08(32'b00111100111000111001010110111101),
.pxl_out(pxl_out_368), .valid_out(valid_out_368) );

//Channel 369
conv_33 #(D, DATA_WIDTH) x369(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111101000010000000101100111000),
.kernel_01(32'b00111100000111011111010001101010),
.kernel_02(32'b00111011110001111011010111001000),
.kernel_03(32'b00111100001100011000101111101111),
.kernel_04(32'b10111101100001011100010000100110),
.kernel_05(32'b10111101011000101101101000011000),
.kernel_06(32'b10111010110001011101010111101011),
.kernel_07(32'b10111011000011111001110110101011),
.kernel_08(32'b10111101111000100011111001110100),
.pxl_out(pxl_out_369), .valid_out(valid_out_369) );

//Channel 370
conv_33 #(D, DATA_WIDTH) x370(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111101001110010111100111100110),
.kernel_01(32'b10111101110110101101010011110011),
.kernel_02(32'b10111101110001100100001001110101),
.kernel_03(32'b00111101011011001100111001100110),
.kernel_04(32'b10111110000110110000000100011110),
.kernel_05(32'b10111100101001100000001100110010),
.kernel_06(32'b00111101011011000000001000101010),
.kernel_07(32'b10111110001101100000011001000110),
.kernel_08(32'b10111101001001011111101001001011),
.pxl_out(pxl_out_370), .valid_out(valid_out_370) );

//Channel 371
conv_33 #(D, DATA_WIDTH) x371(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111100001110000111001000111100),
.kernel_01(32'b10111101011010111010001101101000),
.kernel_02(32'b10111011110111000110100011100001),
.kernel_03(32'b10111110001000011110101001111011),
.kernel_04(32'b00111100000101100110010101110000),
.kernel_05(32'b00111101001101100111110100001100),
.kernel_06(32'b10111101101100101100111111111001),
.kernel_07(32'b00111011111010010010110101011100),
.kernel_08(32'b10111100101010101001111111010001),
.pxl_out(pxl_out_371), .valid_out(valid_out_371) );

//Channel 372
conv_33 #(D, DATA_WIDTH) x372(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111101011111101101100011010111),
.kernel_01(32'b10111100000011101000101111101111),
.kernel_02(32'b00111110010000100111100011111011),
.kernel_03(32'b10111100010000101010011101100110),
.kernel_04(32'b10111101010100111111111110011111),
.kernel_05(32'b00111101000011101001100110100111),
.kernel_06(32'b10111101010010101101110010111110),
.kernel_07(32'b00111100101111111101011110101111),
.kernel_08(32'b10111100100100001101010001010111),
.pxl_out(pxl_out_372), .valid_out(valid_out_372) );

//Channel 373
conv_33 #(D, DATA_WIDTH) x373(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111101011001111111101111011110),
.kernel_01(32'b10111101011001011110001011110111),
.kernel_02(32'b10111101000010111000001001010100),
.kernel_03(32'b10111101011001111000001111001110),
.kernel_04(32'b00111101011000011011000000011011),
.kernel_05(32'b00111011100010001010000010101111),
.kernel_06(32'b00111110001111001110101010100100),
.kernel_07(32'b00111100011110110110011100000100),
.kernel_08(32'b00111011100111110001101010001100),
.pxl_out(pxl_out_373), .valid_out(valid_out_373) );

//Channel 374
conv_33 #(D, DATA_WIDTH) x374(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111101111011111101000001110010),
.kernel_01(32'b00111100101010101110010100111110),
.kernel_02(32'b10111100010111110000111001001000),
.kernel_03(32'b10111011000000100010101010010101),
.kernel_04(32'b00111101111001011000100000110100),
.kernel_05(32'b10111101010100110110000101111100),
.kernel_06(32'b10111110000000110011100101111000),
.kernel_07(32'b00111100101100010111001001000010),
.kernel_08(32'b10111101100011101110100100011100),
.pxl_out(pxl_out_374), .valid_out(valid_out_374) );

//Channel 375
conv_33 #(D, DATA_WIDTH) x375(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111110001001111000100010001000),
.kernel_01(32'b00111101000111010101101101010001),
.kernel_02(32'b00111110000001110001110000000110),
.kernel_03(32'b00111101111011001110101011001010),
.kernel_04(32'b10111011000000001100101011100101),
.kernel_05(32'b10111101101000101111100100011110),
.kernel_06(32'b00111100111111000101010111001101),
.kernel_07(32'b10111101010001101100011111000111),
.kernel_08(32'b10111101100011111000001110011101),
.pxl_out(pxl_out_375), .valid_out(valid_out_375) );

//Channel 376
conv_33 #(D, DATA_WIDTH) x376(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111011010000111111010101011000),
.kernel_01(32'b00111101010111101010101101101010),
.kernel_02(32'b00111010001010010100001111111000),
.kernel_03(32'b00111100001010010000100110010010),
.kernel_04(32'b10111100001001011111101100001100),
.kernel_05(32'b10111101111000100011000100101101),
.kernel_06(32'b00111110000111011110101101101100),
.kernel_07(32'b10111100101001111110100011101010),
.kernel_08(32'b00111110011001010100111101000010),
.pxl_out(pxl_out_376), .valid_out(valid_out_376) );

//Channel 377
conv_33 #(D, DATA_WIDTH) x377(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111100100110111111000110010110),
.kernel_01(32'b10111110000001001111011110001011),
.kernel_02(32'b00111101111000111000010010110011),
.kernel_03(32'b00111100111001111100110001111100),
.kernel_04(32'b00111110100110100110010100100111),
.kernel_05(32'b10111100100100100001010110010101),
.kernel_06(32'b10111101001010011101110100011111),
.kernel_07(32'b10111100000001010110011100110010),
.kernel_08(32'b00111110000100100101011011100010),
.pxl_out(pxl_out_377), .valid_out(valid_out_377) );

//Channel 378
conv_33 #(D, DATA_WIDTH) x378(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b00111101001110110100101001101100),
.kernel_01(32'b10111100110110011100001111011000),
.kernel_02(32'b10111100111101101010100011100001),
.kernel_03(32'b00111100011000100010111111100101),
.kernel_04(32'b00111101000100001001110101110100),
.kernel_05(32'b10111101001110101101101011000101),
.kernel_06(32'b00111101010101001101001111111010),
.kernel_07(32'b00111101101010010001001110101011),
.kernel_08(32'b10111100100110010110111000001011),
.pxl_out(pxl_out_378), .valid_out(valid_out_378) );

//Channel 379
conv_33 #(D, DATA_WIDTH) x379(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111110000110101010101010101111),
.kernel_01(32'b00111110010100011111111110001011),
.kernel_02(32'b00111101101011111101101110001101),
.kernel_03(32'b10111101100101011100100111101011),
.kernel_04(32'b10111101100111100010111001000110),
.kernel_05(32'b00111100101101110110011100010010),
.kernel_06(32'b00111110010001111001110010110000),
.kernel_07(32'b00111100100010000111110000101011),
.kernel_08(32'b00111110000000110110010001100010),
.pxl_out(pxl_out_379), .valid_out(valid_out_379) );

//Channel 380
conv_33 #(D, DATA_WIDTH) x380(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111100111101000110010101101101),
.kernel_01(32'b10111101011111111101101111001000),
.kernel_02(32'b00111101011110001111010111111111),
.kernel_03(32'b10111101101101010011100100111101),
.kernel_04(32'b10111101010110001101010100111000),
.kernel_05(32'b00111101100000011011100111010101),
.kernel_06(32'b00111101010100110101100010111100),
.kernel_07(32'b00111100011010101111111111000110),
.kernel_08(32'b00111010100101101111111111011100),
.pxl_out(pxl_out_380), .valid_out(valid_out_380) );

//Channel 381
conv_33 #(D, DATA_WIDTH) x381(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111100100000011110010000000100),
.kernel_01(32'b00111100011111010000001101110110),
.kernel_02(32'b00111101101001011001010010101110),
.kernel_03(32'b10111100100111001001111010110010),
.kernel_04(32'b10111101100100011011001110000001),
.kernel_05(32'b00111101100100011000001011101000),
.kernel_06(32'b00111101111011011001110111101000),
.kernel_07(32'b00111101001000111011011110110101),
.kernel_08(32'b10111101011001011011011101010100),
.pxl_out(pxl_out_381), .valid_out(valid_out_381) );

//Channel 382
conv_33 #(D, DATA_WIDTH) x382(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b00111111010110000101110110010001),
.kernel_01(32'b00111101110111000010110101100111),
.kernel_02(32'b00111101010000111111000111110101),
.kernel_03(32'b10111101101100011100001000100011),
.kernel_04(32'b10111100000011000100000101011100),
.kernel_05(32'b00111100011101111000001001101001),
.kernel_06(32'b10111101000010101000010001101000),
.kernel_07(32'b00111101111110100010011011010010),
.kernel_08(32'b00111101001101111011111001000101),
.pxl_out(pxl_out_382), .valid_out(valid_out_382) );

//Channel 383
conv_33 #(D, DATA_WIDTH) x383(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111111010000110001001100001100),
.kernel_01(32'b00111011111100101011000101100001),
.kernel_02(32'b10111110000011000100001110001010),
.kernel_03(32'b00111011101101100101001110111001),
.kernel_04(32'b00111100111011110100000001000101),
.kernel_05(32'b10111101011000010011010110111000),
.kernel_06(32'b00111101100100101011011011100000),
.kernel_07(32'b10111101000101001010000011000110),
.kernel_08(32'b00111100110110100101111100000001),
.pxl_out(pxl_out_383), .valid_out(valid_out_383) );

//Channel 384
conv_33 #(D, DATA_WIDTH) x384(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111101000011001000100010011100),
.kernel_01(32'b10111100110011101100101010000000),
.kernel_02(32'b10111110101001010010010011101100),
.kernel_03(32'b00111110011100101001111111011110),
.kernel_04(32'b10111101000100011110000010010001),
.kernel_05(32'b00111101110001001000101001101100),
.kernel_06(32'b00111100110010100111001101000011),
.kernel_07(32'b10111100101001101001100010010000),
.kernel_08(32'b10111110111110010000010111110011),
.pxl_out(pxl_out_384), .valid_out(valid_out_384) );

//Channel 385
conv_33 #(D, DATA_WIDTH) x385(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b10111110011100011101000000011001),
.kernel_01(32'b00111110010000101111100011101000),
.kernel_02(32'b10111110100110100110011010101100),
.kernel_03(32'b00111100001110110101001011100101),
.kernel_04(32'b10111110000001010001110111010010),
.kernel_05(32'b00111101110101010110011001111111),
.kernel_06(32'b10111100000000010111111111000111),
.kernel_07(32'b10111101000011000000001010101011),
.kernel_08(32'b00111100110100101101101010011111),
.pxl_out(pxl_out_385), .valid_out(valid_out_385) );

//Channel 386
conv_33 #(D, DATA_WIDTH) x386(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111110000000111011101011101010),
.kernel_01(32'b10111011100001100100110111100010),
.kernel_02(32'b00111101100011100010000101111010),
.kernel_03(32'b10111100111101011111100110111110),
.kernel_04(32'b00111100110000101101110000101111),
.kernel_05(32'b10111101101011000101111011011000),
.kernel_06(32'b10111100100000111000110100011001),
.kernel_07(32'b00111101111000000101000011000101),
.kernel_08(32'b10111100100101111100010110110010),
.pxl_out(pxl_out_386), .valid_out(valid_out_386) );

//Channel 387
conv_33 #(D, DATA_WIDTH) x387(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111100011101101001110001001100),
.kernel_01(32'b10111011111100010111000111110010),
.kernel_02(32'b10111011100101100111011000000000),
.kernel_03(32'b10111110001001001010001011001100),
.kernel_04(32'b10111101111110000010010111011011),
.kernel_05(32'b00111101111111111011100011010010),
.kernel_06(32'b00111101011010011110101001111000),
.kernel_07(32'b00111010101100000101101111100110),
.kernel_08(32'b10111101010000010001111011000110),
.pxl_out(pxl_out_387), .valid_out(valid_out_387) );

//Channel 388
conv_33 #(D, DATA_WIDTH) x388(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111001100110110000110111011011),
.kernel_01(32'b10111101100001100110101111111011),
.kernel_02(32'b10111101110111100101111000111101),
.kernel_03(32'b00111100110101011110100010100001),
.kernel_04(32'b10111101100000110100000011000011),
.kernel_05(32'b00111101101011000111111110000110),
.kernel_06(32'b10111101011000111000001001110000),
.kernel_07(32'b00111101111101011001010000110001),
.kernel_08(32'b00111101101111001011000001110011),
.pxl_out(pxl_out_388), .valid_out(valid_out_388) );

//Channel 389
conv_33 #(D, DATA_WIDTH) x389(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111100101101110001101001110111),
.kernel_01(32'b00111101101010101110011100110011),
.kernel_02(32'b00111110001001000010100000001110),
.kernel_03(32'b10111100111011111101110011101111),
.kernel_04(32'b10111101110110001000010101111100),
.kernel_05(32'b10111110010111110100000101111001),
.kernel_06(32'b10111110001011101111001010110100),
.kernel_07(32'b00111101001011110010010010000010),
.kernel_08(32'b10111110000010100110011111110100),
.pxl_out(pxl_out_389), .valid_out(valid_out_389) );

//Channel 390
conv_33 #(D, DATA_WIDTH) x390(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111101010110011101111100110001),
.kernel_01(32'b00111101110100000010100000110000),
.kernel_02(32'b00111101100001110101101101010111),
.kernel_03(32'b10111100111000110110001000011100),
.kernel_04(32'b10111110000000011111011110111110),
.kernel_05(32'b10111101110011111000111000100111),
.kernel_06(32'b00111101111100111111001101110101),
.kernel_07(32'b00111101110010111111110101111000),
.kernel_08(32'b10111100001011110000010100101111),
.pxl_out(pxl_out_390), .valid_out(valid_out_390) );

//Channel 391
conv_33 #(D, DATA_WIDTH) x391(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b00111101110111001110111000100111),
.kernel_01(32'b10111101000001110001101000111001),
.kernel_02(32'b00111110000000111000110011000000),
.kernel_03(32'b00111110101000110000001100101010),
.kernel_04(32'b00111011101110100011010110111010),
.kernel_05(32'b00111101110011001110010111000010),
.kernel_06(32'b10111110110100100010000101010001),
.kernel_07(32'b10111100110010011001000111000101),
.kernel_08(32'b00111101011010110101001011101100),
.pxl_out(pxl_out_391), .valid_out(valid_out_391) );

//Channel 392
conv_33 #(D, DATA_WIDTH) x392(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111101101010101010011010001001),
.kernel_01(32'b10111101101001010111110100000001),
.kernel_02(32'b10111101001100011011000101011101),
.kernel_03(32'b00111101010001000010010110111001),
.kernel_04(32'b00111011001111101000110010110011),
.kernel_05(32'b00111101111100001000100101001010),
.kernel_06(32'b00111101111010110110101000100000),
.kernel_07(32'b00111101010111111110000011111110),
.kernel_08(32'b00111100110011010011000110100011),
.pxl_out(pxl_out_392), .valid_out(valid_out_392) );

//Channel 393
conv_33 #(D, DATA_WIDTH) x393(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111100101101010001110001000100),
.kernel_01(32'b00111100001000111110000010001101),
.kernel_02(32'b10111101000111110111111110100001),
.kernel_03(32'b10111011101111010110101011101010),
.kernel_04(32'b10111100000111101111100101001111),
.kernel_05(32'b00111101100001111011011111111111),
.kernel_06(32'b10111010110000101110010001001000),
.kernel_07(32'b10111011000100011110010000011101),
.kernel_08(32'b10111100011010101011000010110000),
.pxl_out(pxl_out_393), .valid_out(valid_out_393) );

//Channel 394
conv_33 #(D, DATA_WIDTH) x394(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b10111101000001011001001111101100),
.kernel_01(32'b00111100100111101100000110101001),
.kernel_02(32'b00111101010111000011100010011001),
.kernel_03(32'b00111100110011001000100000010001),
.kernel_04(32'b00111100101101000100011000010011),
.kernel_05(32'b10111101100100000011110101001100),
.kernel_06(32'b00111101001011100111001100011100),
.kernel_07(32'b00111101000111011000110101100101),
.kernel_08(32'b00111100000011001010001000110001),
.pxl_out(pxl_out_394), .valid_out(valid_out_394) );

//Channel 395
conv_33 #(D, DATA_WIDTH) x395(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111101000101111100001000110011),
.kernel_01(32'b00111100111000110010111110110001),
.kernel_02(32'b10111101101110110011110000100010),
.kernel_03(32'b10111101010101101001000001101011),
.kernel_04(32'b00111010011110101010000001101111),
.kernel_05(32'b00111101100101000000011110110111),
.kernel_06(32'b00111110101111010001100111100010),
.kernel_07(32'b00111101011100110001001101000100),
.kernel_08(32'b10111101010001001100000000111011),
.pxl_out(pxl_out_395), .valid_out(valid_out_395) );

//Channel 396
conv_33 #(D, DATA_WIDTH) x396(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b10111100110100101011001110100011),
.kernel_01(32'b00111100001100111110111110000010),
.kernel_02(32'b00111110001000011111110010011101),
.kernel_03(32'b10111101010010011111001111101000),
.kernel_04(32'b10111101010000110100011011111110),
.kernel_05(32'b00111101001100100011101010100101),
.kernel_06(32'b00111011101100100001010101101010),
.kernel_07(32'b10111110001010000001010100010111),
.kernel_08(32'b00111100011001000100011110110110),
.pxl_out(pxl_out_396), .valid_out(valid_out_396) );

//Channel 397
conv_33 #(D, DATA_WIDTH) x397(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111101010101101101011110111110),
.kernel_01(32'b10111110110111100101111100100100),
.kernel_02(32'b00111100110110110111100111011100),
.kernel_03(32'b10111110001110011000011101001010),
.kernel_04(32'b00111100111010011010010010101101),
.kernel_05(32'b00111100001000101011101100111111),
.kernel_06(32'b10111101000111100000010101010101),
.kernel_07(32'b10111100100001001001110000010000),
.kernel_08(32'b10111101100110011001001011011011),
.pxl_out(pxl_out_397), .valid_out(valid_out_397) );

//Channel 398
conv_33 #(D, DATA_WIDTH) x398(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111110000110001001000011101101),
.kernel_01(32'b10111100111111110111001000100010),
.kernel_02(32'b00111101110001000101100100011101),
.kernel_03(32'b00111101001000001000111010111111),
.kernel_04(32'b10111101111100111010110100101011),
.kernel_05(32'b10111101010000000001010000100001),
.kernel_06(32'b00111101011110110100110001000011),
.kernel_07(32'b00111100111010011011010101000101),
.kernel_08(32'b00111101101010111011111111100001),
.pxl_out(pxl_out_398), .valid_out(valid_out_398) );

//Channel 399
conv_33 #(D, DATA_WIDTH) x399(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111010000001100110010011100000),
.kernel_01(32'b00111110000111010101000011000010),
.kernel_02(32'b10111101011110111101110011101111),
.kernel_03(32'b00111100000010110100011001111000),
.kernel_04(32'b00111101111010011100000000101100),
.kernel_05(32'b00111100011011110100001101101001),
.kernel_06(32'b10111100111001010010011101111111),
.kernel_07(32'b00111110111010101000001000001101),
.kernel_08(32'b10111010010011011011000011101111),
.pxl_out(pxl_out_399), .valid_out(valid_out_399) );

//Channel 400
conv_33 #(D, DATA_WIDTH) x400(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111011100001110000011000010100),
.kernel_01(32'b10111100100111100001100000110101),
.kernel_02(32'b00111100101011101000110011101110),
.kernel_03(32'b00111100011111111011110001111011),
.kernel_04(32'b10111101001100000000101000010111),
.kernel_05(32'b00111101010111011110010110001100),
.kernel_06(32'b00111101000011111000001001110101),
.kernel_07(32'b10111111001100011111100110000111),
.kernel_08(32'b10111101011001110010101101011101),
.pxl_out(pxl_out_400), .valid_out(valid_out_400) );

//Channel 401
conv_33 #(D, DATA_WIDTH) x401(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111101101100011101101110010101),
.kernel_01(32'b00111011101100101010011101110010),
.kernel_02(32'b00111100001100011011010011111011),
.kernel_03(32'b10111101001110011100111010000000),
.kernel_04(32'b00111100111110101110100111101010),
.kernel_05(32'b00111100100101001111101000111001),
.kernel_06(32'b00111011011101110111111100100001),
.kernel_07(32'b00111011000000000111101111011010),
.kernel_08(32'b10111011100110000110100001110100),
.pxl_out(pxl_out_401), .valid_out(valid_out_401) );

//Channel 402
conv_33 #(D, DATA_WIDTH) x402(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111110101011101100011100110111),
.kernel_01(32'b00111110101101001011101001010111),
.kernel_02(32'b10111101000100000001110111011101),
.kernel_03(32'b00111110001011000010111101011101),
.kernel_04(32'b00111101001000001000110011010110),
.kernel_05(32'b10111100001111000001010111111001),
.kernel_06(32'b00111101101010010010000100100111),
.kernel_07(32'b10111110110110011101010000100010),
.kernel_08(32'b00111101010010101111101010000110),
.pxl_out(pxl_out_402), .valid_out(valid_out_402) );

//Channel 403
conv_33 #(D, DATA_WIDTH) x403(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111110001111100110000011011011),
.kernel_01(32'b10111101110000101100110000001101),
.kernel_02(32'b00111011010110001100010000110111),
.kernel_03(32'b00111100000010001101001101100110),
.kernel_04(32'b10111101011000010011110001001111),
.kernel_05(32'b10111101000001101111011100001111),
.kernel_06(32'b10111101011011100000010001100000),
.kernel_07(32'b10111101110110011010010011010000),
.kernel_08(32'b10111101011100101101101000001111),
.pxl_out(pxl_out_403), .valid_out(valid_out_403) );

//Channel 404
conv_33 #(D, DATA_WIDTH) x404(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111101110000011000010100000100),
.kernel_01(32'b10111101101001001111111001111111),
.kernel_02(32'b00111111000001100110010111000110),
.kernel_03(32'b00111100101111010101010001100111),
.kernel_04(32'b10111101100110100111110011000011),
.kernel_05(32'b10111101110110100101111101111101),
.kernel_06(32'b00111101101010100111011000100011),
.kernel_07(32'b10111100111011000010000000100010),
.kernel_08(32'b10111101001101010111011010011111),
.pxl_out(pxl_out_404), .valid_out(valid_out_404) );

//Channel 405
conv_33 #(D, DATA_WIDTH) x405(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111101101001010101001010011010),
.kernel_01(32'b10111101111100111000110111110011),
.kernel_02(32'b10111101010011001010001111101011),
.kernel_03(32'b00111011111101100110000011110010),
.kernel_04(32'b10111110001111010011010100001010),
.kernel_05(32'b10111101100110110001110001011110),
.kernel_06(32'b10111100100110110010110000101111),
.kernel_07(32'b10111101101101010010110010011100),
.kernel_08(32'b00111101000110101101110000010001),
.pxl_out(pxl_out_405), .valid_out(valid_out_405) );

//Channel 406
conv_33 #(D, DATA_WIDTH) x406(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b00111100111010110010010010100001),
.kernel_01(32'b00111101101100010100110001000100),
.kernel_02(32'b10111100011001011100111000001111),
.kernel_03(32'b00111110101011011011000100000111),
.kernel_04(32'b00111100010100001111000011001110),
.kernel_05(32'b10111100110001011010110110101101),
.kernel_06(32'b10111100001010001100101110010111),
.kernel_07(32'b00111100100001011000110101111111),
.kernel_08(32'b00111111010000101111100100110101),
.pxl_out(pxl_out_406), .valid_out(valid_out_406) );

//Channel 407
conv_33 #(D, DATA_WIDTH) x407(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b00111101101110100101001011000001),
.kernel_01(32'b00111101000011100101110101101100),
.kernel_02(32'b00111101000011110011110101000110),
.kernel_03(32'b00111100110010000111110111011101),
.kernel_04(32'b10111110010111011100000001111001),
.kernel_05(32'b10111100100100111011011000000110),
.kernel_06(32'b00111101100010011100111010100101),
.kernel_07(32'b10111110111101000110011010111101),
.kernel_08(32'b10111110100101000111111001101001),
.pxl_out(pxl_out_407), .valid_out(valid_out_407) );

//Channel 408
conv_33 #(D, DATA_WIDTH) x408(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b10111100001010010101000110101111),
.kernel_01(32'b00111101110110010101100110111001),
.kernel_02(32'b10111011101111000110010000100011),
.kernel_03(32'b10111011011000001011000111111111),
.kernel_04(32'b00111101010000001010000010001101),
.kernel_05(32'b10111101010110111010001110011001),
.kernel_06(32'b00111110001000101100100011000010),
.kernel_07(32'b00111100011111101000111001000110),
.kernel_08(32'b00111101010000010001111000000001),
.pxl_out(pxl_out_408), .valid_out(valid_out_408) );

//Channel 409
conv_33 #(D, DATA_WIDTH) x409(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111101100101010010011101011010),
.kernel_01(32'b10111101100110000111111001101011),
.kernel_02(32'b10111110011111000101010101011110),
.kernel_03(32'b00111101101110110010111010000100),
.kernel_04(32'b10111100000101110111111110001110),
.kernel_05(32'b00111110000011101001100110111001),
.kernel_06(32'b10111100001000001111011101110111),
.kernel_07(32'b00111101101101010000110011001101),
.kernel_08(32'b10111110010001110100011100100110),
.pxl_out(pxl_out_409), .valid_out(valid_out_409) );

//Channel 410
conv_33 #(D, DATA_WIDTH) x410(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111101101101010011101100110001),
.kernel_01(32'b00111101110110100110100111110001),
.kernel_02(32'b10111101001101001101011110010101),
.kernel_03(32'b00111101111111100010111001011000),
.kernel_04(32'b00111101100110001010000111011001),
.kernel_05(32'b00111101001100010110100010101011),
.kernel_06(32'b00111101001000100001101010111111),
.kernel_07(32'b10111110000101010111111000011100),
.kernel_08(32'b00111101000010000101001100111001),
.pxl_out(pxl_out_410), .valid_out(valid_out_410) );

//Channel 411
conv_33 #(D, DATA_WIDTH) x411(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111101101000111111001010011101),
.kernel_01(32'b00111101011110100100111011000011),
.kernel_02(32'b10111100111010111110110110101010),
.kernel_03(32'b00111110101001111000001000010000),
.kernel_04(32'b10111100110111111000010100001110),
.kernel_05(32'b10111011011101011100011110001110),
.kernel_06(32'b10111110000110111011101100100111),
.kernel_07(32'b10111100011010100110010010110111),
.kernel_08(32'b00111011001111100111100111101111),
.pxl_out(pxl_out_411), .valid_out(valid_out_411) );

//Channel 412
conv_33 #(D, DATA_WIDTH) x412(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111101111001110001010101011100),
.kernel_01(32'b10111011100001111010100100000011),
.kernel_02(32'b10111101000000001101101011100100),
.kernel_03(32'b10111101001100010111010011110101),
.kernel_04(32'b10111110000111011100010111110011),
.kernel_05(32'b10111100010100010001011100100100),
.kernel_06(32'b00111011110010011011101001110010),
.kernel_07(32'b10111101111110001001101100011101),
.kernel_08(32'b00111100010100010000101100010011),
.pxl_out(pxl_out_412), .valid_out(valid_out_412) );

//Channel 413
conv_33 #(D, DATA_WIDTH) x413(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b10111101011100101000111010101001),
.kernel_01(32'b10111101011110100111001111100111),
.kernel_02(32'b00111101010001101000111110101110),
.kernel_03(32'b00111101100001111010010011000011),
.kernel_04(32'b10111110001011101110000000111011),
.kernel_05(32'b10111101000001110101001011010101),
.kernel_06(32'b00111101011111011000000001101000),
.kernel_07(32'b00111011101100001110100100100110),
.kernel_08(32'b00111110000111011100101111111111),
.pxl_out(pxl_out_413), .valid_out(valid_out_413) );

//Channel 414
conv_33 #(D, DATA_WIDTH) x414(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b00111110010101001110000101111111),
.kernel_01(32'b00111100010101011100110010010101),
.kernel_02(32'b10111101101110001000000001001010),
.kernel_03(32'b10111100110010010100001111010011),
.kernel_04(32'b00111101000001011100010001011010),
.kernel_05(32'b00111101000000010010010010010011),
.kernel_06(32'b00111100110010100100011110111000),
.kernel_07(32'b10111100100011110011101001111110),
.kernel_08(32'b00111110010000000010100101010001),
.pxl_out(pxl_out_414), .valid_out(valid_out_414) );

//Channel 415
conv_33 #(D, DATA_WIDTH) x415(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111110000011001100011000010100),
.kernel_01(32'b00111101011001100110011010111100),
.kernel_02(32'b10111100100000001011101011001111),
.kernel_03(32'b10111100101011111000101111101000),
.kernel_04(32'b10111101000011111101100011111100),
.kernel_05(32'b00111101010101101001101011100101),
.kernel_06(32'b00111011101110011001000101100001),
.kernel_07(32'b10111101100100001101010100110101),
.kernel_08(32'b10111101011010000101010110011011),
.pxl_out(pxl_out_415), .valid_out(valid_out_415) );

//Channel 416
conv_33 #(D, DATA_WIDTH) x416(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111101100100100011001101001000),
.kernel_01(32'b00111100010010101011010011000111),
.kernel_02(32'b00111100110001100111001010110101),
.kernel_03(32'b10111101111011110010010111101000),
.kernel_04(32'b00111100011010000010000011101000),
.kernel_05(32'b00111100111000110111110101101101),
.kernel_06(32'b10111101010111000001100001110110),
.kernel_07(32'b00111011101101110110001011000010),
.kernel_08(32'b10111101100001101100001110000100),
.pxl_out(pxl_out_416), .valid_out(valid_out_416) );

//Channel 417
conv_33 #(D, DATA_WIDTH) x417(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b10111101101101101010110100001010),
.kernel_01(32'b10111110010001010111101111111110),
.kernel_02(32'b00111110111011001010010100110011),
.kernel_03(32'b10111101110000111000010010001100),
.kernel_04(32'b10111011110001100101011001111101),
.kernel_05(32'b00111101111010000011100010111011),
.kernel_06(32'b10111110001111110010000111110000),
.kernel_07(32'b00111100101110011111100100010001),
.kernel_08(32'b10111110000010111010001101001011),
.pxl_out(pxl_out_417), .valid_out(valid_out_417) );

//Channel 418
conv_33 #(D, DATA_WIDTH) x418(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111110010001011010100001111110),
.kernel_01(32'b00111101001100001110000110000101),
.kernel_02(32'b10111101100001000100001111011100),
.kernel_03(32'b00111110100100100000001100111001),
.kernel_04(32'b00111101111010001001011101111111),
.kernel_05(32'b00111100100010100000000100110111),
.kernel_06(32'b10111110010001000011100111100000),
.kernel_07(32'b10111111000100011110001000010111),
.kernel_08(32'b10111101111000010100011101101110),
.pxl_out(pxl_out_418), .valid_out(valid_out_418) );

//Channel 419
conv_33 #(D, DATA_WIDTH) x419(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111110001011101111110000000001),
.kernel_01(32'b10111101010100010101010111101100),
.kernel_02(32'b00111110001110101001001110001010),
.kernel_03(32'b00111110000100011010110010101010),
.kernel_04(32'b10111110100101101011000001001101),
.kernel_05(32'b10111101011000110101101010001110),
.kernel_06(32'b10111110110001000010101001001001),
.kernel_07(32'b00111110000100011110011000110001),
.kernel_08(32'b00111100111010011011010000000000),
.pxl_out(pxl_out_419), .valid_out(valid_out_419) );

//Channel 420
conv_33 #(D, DATA_WIDTH) x420(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111101100101110000011011111010),
.kernel_01(32'b10111110001010011110010000001111),
.kernel_02(32'b00111101100111100110101000110011),
.kernel_03(32'b00111100111101010001001011111100),
.kernel_04(32'b00111100100101110001101010001101),
.kernel_05(32'b00111110001110110010010010111010),
.kernel_06(32'b00111101100110111111000011011000),
.kernel_07(32'b00111100100011011010101010010011),
.kernel_08(32'b10111100111101000000000111010011),
.pxl_out(pxl_out_420), .valid_out(valid_out_420) );

//Channel 421
conv_33 #(D, DATA_WIDTH) x421(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b10111101000111000101111011000100),
.kernel_01(32'b10111110101101100011111100101100),
.kernel_02(32'b10111100000000101000001100101100),
.kernel_03(32'b00111110000111100010101101001010),
.kernel_04(32'b00111101011001010111101100010001),
.kernel_05(32'b10111011111000011001111000010001),
.kernel_06(32'b10111101100001100001101110011001),
.kernel_07(32'b00111100111001110001101110001100),
.kernel_08(32'b10111101001110000010011111000010),
.pxl_out(pxl_out_421), .valid_out(valid_out_421) );

//Channel 422
conv_33 #(D, DATA_WIDTH) x422(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b10111110100000100001100100000111),
.kernel_01(32'b00111101001101000000001110111000),
.kernel_02(32'b10111101010110000001111110110011),
.kernel_03(32'b00111101101110111001111001101110),
.kernel_04(32'b00111100100001011100111101011011),
.kernel_05(32'b10111011110101010100111110011110),
.kernel_06(32'b10111110010011110010000100010111),
.kernel_07(32'b10111101001001011000011110111010),
.kernel_08(32'b00111101111100100000000001010101),
.pxl_out(pxl_out_422), .valid_out(valid_out_422) );

//Channel 423
conv_33 #(D, DATA_WIDTH) x423(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b00111100010000000110100010111101),
.kernel_01(32'b00111101010110111000000110000111),
.kernel_02(32'b00111101100000010000010110000110),
.kernel_03(32'b10111101100101100000111000001001),
.kernel_04(32'b00111110101000000111001101001010),
.kernel_05(32'b00111101011011111011001100101100),
.kernel_06(32'b10111101000101010001001111111110),
.kernel_07(32'b10111100100101101000011011001100),
.kernel_08(32'b00111101001111010100110010011101),
.pxl_out(pxl_out_423), .valid_out(valid_out_423) );

//Channel 424
conv_33 #(D, DATA_WIDTH) x424(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b10111101101000010001010001101001),
.kernel_01(32'b00111101001110110010011100111100),
.kernel_02(32'b10111110000001000011110010011101),
.kernel_03(32'b00111110010001110010011000011110),
.kernel_04(32'b10111101011111100110101111011100),
.kernel_05(32'b00111101011101110011101101111011),
.kernel_06(32'b10111101101100000001111010100010),
.kernel_07(32'b00111101011101101111000010001100),
.kernel_08(32'b00111110011000011101111100101010),
.pxl_out(pxl_out_424), .valid_out(valid_out_424) );

//Channel 425
conv_33 #(D, DATA_WIDTH) x425(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111101100111010010111001011000),
.kernel_01(32'b00111101111011100000101111110111),
.kernel_02(32'b10111110101010010110101101011000),
.kernel_03(32'b00111100111010101011000010001110),
.kernel_04(32'b10111100001110010010100110001100),
.kernel_05(32'b10111110101001100011000101011010),
.kernel_06(32'b00111101101000100011011001100011),
.kernel_07(32'b00111100111001001011111100111001),
.kernel_08(32'b10111110010000011000011001000011),
.pxl_out(pxl_out_425), .valid_out(valid_out_425) );

//Channel 426
conv_33 #(D, DATA_WIDTH) x426(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b10111100111110101000101110111110),
.kernel_01(32'b10111110010000010111010011000001),
.kernel_02(32'b10111101101101111011000100011011),
.kernel_03(32'b00111101011100011000101000000100),
.kernel_04(32'b00111101100101100101010011010001),
.kernel_05(32'b10111100110010011010011101001000),
.kernel_06(32'b10111110010111000010000110111111),
.kernel_07(32'b10111100010000011101010100101110),
.kernel_08(32'b00111100110110001101001110000100),
.pxl_out(pxl_out_426), .valid_out(valid_out_426) );

//Channel 427
conv_33 #(D, DATA_WIDTH) x427(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b00111101100110010111000000101000),
.kernel_01(32'b00111110000001101011010000100001),
.kernel_02(32'b00111101010101011101010101001101),
.kernel_03(32'b00111101100011110001101000111111),
.kernel_04(32'b10111011110001101000110001100010),
.kernel_05(32'b00111100110101000010100011010100),
.kernel_06(32'b00111110000010100100111101111011),
.kernel_07(32'b10111110000001101011110010101110),
.kernel_08(32'b00111101100000111001000010001010),
.pxl_out(pxl_out_427), .valid_out(valid_out_427) );

//Channel 428
conv_33 #(D, DATA_WIDTH) x428(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111101100101101101011110011011),
.kernel_01(32'b10111100010000110111111010101001),
.kernel_02(32'b00111101110001001000111101000010),
.kernel_03(32'b10111100000011011100101101001001),
.kernel_04(32'b10111110000011111001100110011011),
.kernel_05(32'b10111101100101101101101110100111),
.kernel_06(32'b10111101011110110101100101001010),
.kernel_07(32'b10111110000001000000101110010001),
.kernel_08(32'b10111101001011101010000001010100),
.pxl_out(pxl_out_428), .valid_out(valid_out_428) );

//Channel 429
conv_33 #(D, DATA_WIDTH) x429(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111110110100101010111010111111),
.kernel_01(32'b10111110100000011010000011100001),
.kernel_02(32'b00111110000010100111110100000111),
.kernel_03(32'b10111101010100000101011011100101),
.kernel_04(32'b10111110110101011100100010010110),
.kernel_05(32'b10111101110110010110001100011001),
.kernel_06(32'b00111110101011111011010001110100),
.kernel_07(32'b10111101110001010000111010101011),
.kernel_08(32'b00111100010110000011011111110101),
.pxl_out(pxl_out_429), .valid_out(valid_out_429) );

//Channel 430
conv_33 #(D, DATA_WIDTH) x430(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111110100101011001010100110011),
.kernel_01(32'b10111110010100000111110110100000),
.kernel_02(32'b10111101011100010010011011100111),
.kernel_03(32'b10111110001001101111100011011011),
.kernel_04(32'b00111100110011101100010001101001),
.kernel_05(32'b00111110010010111000001100010000),
.kernel_06(32'b10111110000101000001010111111000),
.kernel_07(32'b10111101100110101011000111100101),
.kernel_08(32'b10111100010111100101101111100010),
.pxl_out(pxl_out_430), .valid_out(valid_out_430) );

//Channel 431
conv_33 #(D, DATA_WIDTH) x431(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b10111101110101100011111101000110),
.kernel_01(32'b10111101000100000100101000111110),
.kernel_02(32'b10111110100110100000111100011010),
.kernel_03(32'b10111100101011110010001000010000),
.kernel_04(32'b00111101011011100111001110010110),
.kernel_05(32'b00111101001001101000100011111000),
.kernel_06(32'b00111100001110110000010011000101),
.kernel_07(32'b00111111010000111110111110100001),
.kernel_08(32'b00111101101001010111110110100110),
.pxl_out(pxl_out_431), .valid_out(valid_out_431) );

//Channel 432
conv_33 #(D, DATA_WIDTH) x432(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111110101111001001000001000010),
.kernel_01(32'b00111100000000010101110100001111),
.kernel_02(32'b00111101000111110011101011011110),
.kernel_03(32'b00111101110110100010111000101001),
.kernel_04(32'b10111101101111100001000110001100),
.kernel_05(32'b00111101000011111010101000011001),
.kernel_06(32'b00111110100100101101110100111110),
.kernel_07(32'b00111101100110101100110111001100),
.kernel_08(32'b00111110100101001101100110000001),
.pxl_out(pxl_out_432), .valid_out(valid_out_432) );

//Channel 433
conv_33 #(D, DATA_WIDTH) x433(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111101000101001000101010111101),
.kernel_01(32'b10111100111110011111111101011011),
.kernel_02(32'b00111100010011000011110001101010),
.kernel_03(32'b00111110011010111111110000000110),
.kernel_04(32'b10111010011111010100011101000011),
.kernel_05(32'b10111101100110001101001101110010),
.kernel_06(32'b00111100110000000111100111110010),
.kernel_07(32'b10111100110001101101100100111101),
.kernel_08(32'b10111101010010000100110011010111),
.pxl_out(pxl_out_433), .valid_out(valid_out_433) );

//Channel 434
conv_33 #(D, DATA_WIDTH) x434(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111100100001101011110001010100),
.kernel_01(32'b10111111001100100000011000110010),
.kernel_02(32'b10111100000110010101100101110001),
.kernel_03(32'b10111101000100011010001001111000),
.kernel_04(32'b00111110001100010001010110010000),
.kernel_05(32'b10111101001100011010100010010111),
.kernel_06(32'b10111110010001000001100100000010),
.kernel_07(32'b10111111100110000101110111011101),
.kernel_08(32'b10111100111101101111101110011101),
.pxl_out(pxl_out_434), .valid_out(valid_out_434) );

//Channel 435
conv_33 #(D, DATA_WIDTH) x435(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111101101100000000111110010111),
.kernel_01(32'b00111101100101101110111011011100),
.kernel_02(32'b00111100000100101111101101110000),
.kernel_03(32'b00111101011010010001000101000101),
.kernel_04(32'b00111101110000011100110000010011),
.kernel_05(32'b10111101111000010110100011001100),
.kernel_06(32'b10111101110011100111011011011000),
.kernel_07(32'b00111101011011101011110100100000),
.kernel_08(32'b00111110001011010001110110011101),
.pxl_out(pxl_out_435), .valid_out(valid_out_435) );

//Channel 436
conv_33 #(D, DATA_WIDTH) x436(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111101000000001101010000011111),
.kernel_01(32'b10111101001000111111001001110101),
.kernel_02(32'b00111111101110010101101101110111),
.kernel_03(32'b10111101010000110111111110110001),
.kernel_04(32'b00111101100110110101010100101110),
.kernel_05(32'b00111110100100001010010010101110),
.kernel_06(32'b00111100100001111100010000001010),
.kernel_07(32'b10111101001110100001011100101111),
.kernel_08(32'b10111101101101100100100111011001),
.pxl_out(pxl_out_436), .valid_out(valid_out_436) );

//Channel 437
conv_33 #(D, DATA_WIDTH) x437(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111101010101010111000101100011),
.kernel_01(32'b10111101111000101110100010101011),
.kernel_02(32'b10111101010001111011111010101101),
.kernel_03(32'b10111110011110001111110010000101),
.kernel_04(32'b10111011111101101110101000011101),
.kernel_05(32'b00111101001101110000001101001000),
.kernel_06(32'b10111101110110110011110000110100),
.kernel_07(32'b00111101111001111101100111100001),
.kernel_08(32'b00111100010010101101101101100011),
.pxl_out(pxl_out_437), .valid_out(valid_out_437) );

//Channel 438
conv_33 #(D, DATA_WIDTH) x438(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111101110100010010011111000011),
.kernel_01(32'b10111101010010110110100001010010),
.kernel_02(32'b00111101000001000110010010000000),
.kernel_03(32'b00111111010100000001000101000011),
.kernel_04(32'b00111101001000011110010000000100),
.kernel_05(32'b10111110000000110100110011000111),
.kernel_06(32'b10111101011010010101111111111111),
.kernel_07(32'b10111011010110100110000111101111),
.kernel_08(32'b00111111001011011100011110101100),
.pxl_out(pxl_out_438), .valid_out(valid_out_438) );

//Channel 439
conv_33 #(D, DATA_WIDTH) x439(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111101011011011111000100111001),
.kernel_01(32'b10111101110111111010001011111001),
.kernel_02(32'b00111101100110001001010010010111),
.kernel_03(32'b00111011110111100001110011100000),
.kernel_04(32'b10111110010001011101100010010110),
.kernel_05(32'b00111100110010101001001111011011),
.kernel_06(32'b00111011011000001001110100011000),
.kernel_07(32'b10111111011010110101010001010101),
.kernel_08(32'b00111101001101010100011001000111),
.pxl_out(pxl_out_439), .valid_out(valid_out_439) );

//Channel 440
conv_33 #(D, DATA_WIDTH) x440(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111011101000111111100100110111),
.kernel_01(32'b00111101101011000111011110001010),
.kernel_02(32'b10111101100010110011110001101111),
.kernel_03(32'b00111101100010010111100010100010),
.kernel_04(32'b00111100100011100100010101100011),
.kernel_05(32'b10111101010101101011101101011101),
.kernel_06(32'b00111110100011011111011111100010),
.kernel_07(32'b10111101010000110100101110110010),
.kernel_08(32'b00111101111110001011111001010101),
.pxl_out(pxl_out_440), .valid_out(valid_out_440) );

//Channel 441
conv_33 #(D, DATA_WIDTH) x441(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111101000000101101000100001111),
.kernel_01(32'b00111010110000010110111110001000),
.kernel_02(32'b10111111000000100100010001100011),
.kernel_03(32'b00111101100010000100000111101101),
.kernel_04(32'b00111100110011100001110101000101),
.kernel_05(32'b00111110100000111011010000010001),
.kernel_06(32'b00111100110010100010010101001010),
.kernel_07(32'b10111110001100000010001010101110),
.kernel_08(32'b10111110111001110101111000011011),
.pxl_out(pxl_out_441), .valid_out(valid_out_441) );

//Channel 442
conv_33 #(D, DATA_WIDTH) x442(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b00111100010000110100000011011010),
.kernel_01(32'b10111110100011010011010001101001),
.kernel_02(32'b10111101000101001110100100001001),
.kernel_03(32'b00111100111000000001101110000001),
.kernel_04(32'b00111011111001011010010100110101),
.kernel_05(32'b10111110011110010101110010001110),
.kernel_06(32'b00111101001001001101101111100010),
.kernel_07(32'b00111100010110111010001100010000),
.kernel_08(32'b10111101001111111000011001000101),
.pxl_out(pxl_out_442), .valid_out(valid_out_442) );

//Channel 443
conv_33 #(D, DATA_WIDTH) x443(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111110100101101011000110011010),
.kernel_01(32'b10111101110110110101011010011101),
.kernel_02(32'b00111010011101000011011111011000),
.kernel_03(32'b00111110111110101111110111110101),
.kernel_04(32'b00111100001011100110010110001110),
.kernel_05(32'b10111101110100000001001010011010),
.kernel_06(32'b00111110010001000000011101111000),
.kernel_07(32'b10111100001000110001011110000011),
.kernel_08(32'b10111101000110101001111101101011),
.pxl_out(pxl_out_443), .valid_out(valid_out_443) );

//Channel 444
conv_33 #(D, DATA_WIDTH) x444(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111100110001000011111010111101),
.kernel_01(32'b00110111011000011000110000001001),
.kernel_02(32'b10111110010000110011110000100001),
.kernel_03(32'b10111101101101110111001010111101),
.kernel_04(32'b00111101100011110001010100011010),
.kernel_05(32'b00111101101100110110011000011001),
.kernel_06(32'b00111101011010110101101101000010),
.kernel_07(32'b00111100111010100111001110001101),
.kernel_08(32'b10111101110011010101111110101111),
.pxl_out(pxl_out_444), .valid_out(valid_out_444) );

//Channel 445
conv_33 #(D, DATA_WIDTH) x445(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b10111100101110011000111000011111),
.kernel_01(32'b10111110000010111101011110011101),
.kernel_02(32'b10111101010111010111101110010101),
.kernel_03(32'b10111100001101011101110000111110),
.kernel_04(32'b10111111000110111111010100010110),
.kernel_05(32'b10111110100010111011010111100111),
.kernel_06(32'b00111100110000111101000110101000),
.kernel_07(32'b00111101010010010100010101101010),
.kernel_08(32'b10111101100101110101100011101110),
.pxl_out(pxl_out_445), .valid_out(valid_out_445) );

//Channel 446
conv_33 #(D, DATA_WIDTH) x446(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b00111100011001000111001010101011),
.kernel_01(32'b00111101000001010111100101100000),
.kernel_02(32'b00111101100001011110011001100100),
.kernel_03(32'b10111101101000001000001110001000),
.kernel_04(32'b00111101100100101011110011100101),
.kernel_05(32'b00111110011001110011010010111000),
.kernel_06(32'b00111101011100010000111110011001),
.kernel_07(32'b00111101100001001001100110000001),
.kernel_08(32'b00111111001110111101011111010010),
.pxl_out(pxl_out_446), .valid_out(valid_out_446) );

//Channel 447
conv_33 #(D, DATA_WIDTH) x447(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111101111000110011100000010000),
.kernel_01(32'b00111011111101100000001000110110),
.kernel_02(32'b10111110001111101111110011110101),
.kernel_03(32'b00111101100011010011011010001110),
.kernel_04(32'b10111101011111100110001111000010),
.kernel_05(32'b00111110000101110001110111100011),
.kernel_06(32'b00111110001010010001100010110100),
.kernel_07(32'b10111110001001111010000010001100),
.kernel_08(32'b00111101000001111011101011111011),
.pxl_out(pxl_out_447), .valid_out(valid_out_447) );

//Channel 448
conv_33 #(D, DATA_WIDTH) x448(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111110001000110011000111101100),
.kernel_01(32'b10111110001111000000011111100011),
.kernel_02(32'b10111100010100101101100101100101),
.kernel_03(32'b10111101001010011011111100011100),
.kernel_04(32'b00111101001011110110110111100001),
.kernel_05(32'b10111101000011110011001010001001),
.kernel_06(32'b10111101110010001101101000100100),
.kernel_07(32'b10111011101011111000111111111000),
.kernel_08(32'b10111101100001001101101000011101),
.pxl_out(pxl_out_448), .valid_out(valid_out_448) );

//Channel 449
conv_33 #(D, DATA_WIDTH) x449(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b10111100000011001010011011001011),
.kernel_01(32'b10111110101111110110000110101010),
.kernel_02(32'b10111110010010101101011000111000),
.kernel_03(32'b10111101100100011111000110110001),
.kernel_04(32'b00111101100100100111100000110110),
.kernel_05(32'b10111101001011010000010111111111),
.kernel_06(32'b10111101101010011010000001001111),
.kernel_07(32'b00111110010000110010101011101101),
.kernel_08(32'b10111101110111011001100100100011),
.pxl_out(pxl_out_449), .valid_out(valid_out_449) );

//Channel 450
conv_33 #(D, DATA_WIDTH) x450(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b00111101110010001000100000100101),
.kernel_01(32'b10111110010001100010011111010001),
.kernel_02(32'b10111101011000111101001111100111),
.kernel_03(32'b10111101110001010110100001110110),
.kernel_04(32'b10111110001101100111110101000000),
.kernel_05(32'b10111101110001111110101010111010),
.kernel_06(32'b00111011110110000011111100101000),
.kernel_07(32'b10111110010101100110101011100101),
.kernel_08(32'b00111100111101110010111100011000),
.pxl_out(pxl_out_450), .valid_out(valid_out_450) );

//Channel 451
conv_33 #(D, DATA_WIDTH) x451(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111101101010101000110010100000),
.kernel_01(32'b00111110011000111111111001001011),
.kernel_02(32'b00111101110010011110111111100011),
.kernel_03(32'b10111101110000111101000101000110),
.kernel_04(32'b00111110101010101001111101100111),
.kernel_05(32'b10111101101101001000111000000001),
.kernel_06(32'b10111101000001111100101101011000),
.kernel_07(32'b10111101101010001111100111101010),
.kernel_08(32'b10111101010111101001100110011111),
.pxl_out(pxl_out_451), .valid_out(valid_out_451) );

//Channel 452
conv_33 #(D, DATA_WIDTH) x452(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111010010100011101011101000100),
.kernel_01(32'b00111100011010111111000111101011),
.kernel_02(32'b10111100001110100011011101010010),
.kernel_03(32'b10111101111000110111111010110100),
.kernel_04(32'b00111101100000101000010001011100),
.kernel_05(32'b00111111000110100000110100111110),
.kernel_06(32'b00111110001100000100101000101100),
.kernel_07(32'b10111101010100111111010100100000),
.kernel_08(32'b10111101000100010100001010010000),
.pxl_out(pxl_out_452), .valid_out(valid_out_452) );

//Channel 453
conv_33 #(D, DATA_WIDTH) x453(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b10111100101001110001011110000111),
.kernel_01(32'b10111110101000111101010100101111),
.kernel_02(32'b10111100101001101101010000001010),
.kernel_03(32'b00111100101010000001111100000010),
.kernel_04(32'b00111100110010011110011100000010),
.kernel_05(32'b10111101010001100110000010011110),
.kernel_06(32'b10111110101100100010101010000000),
.kernel_07(32'b00111101000100111001010100011001),
.kernel_08(32'b00111101010011101101011010111101),
.pxl_out(pxl_out_453), .valid_out(valid_out_453) );

//Channel 454
conv_33 #(D, DATA_WIDTH) x454(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b10111111001111111010011101100110),
.kernel_01(32'b10111011111101010100110011000110),
.kernel_02(32'b10111110011101111000001010101010),
.kernel_03(32'b00111110000101101000011101011110),
.kernel_04(32'b00111101010001100101111010101100),
.kernel_05(32'b10111101000011000100001010101011),
.kernel_06(32'b10111101011110100010111001010011),
.kernel_07(32'b10111101100011111111111010111101),
.kernel_08(32'b00111110011010101101111001111110),
.pxl_out(pxl_out_454), .valid_out(valid_out_454) );

//Channel 455
conv_33 #(D, DATA_WIDTH) x455(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111101011011011110111101010101),
.kernel_01(32'b00111110001011110000111000001100),
.kernel_02(32'b00111110000111001010001101001001),
.kernel_03(32'b10111101100101111100001110111111),
.kernel_04(32'b00111110111000110000000001011100),
.kernel_05(32'b00111101110111100111110110110000),
.kernel_06(32'b00111101110111100100110100001100),
.kernel_07(32'b00111101110101100000001001111111),
.kernel_08(32'b00111101010010111010101111111010),
.pxl_out(pxl_out_455), .valid_out(valid_out_455) );

//Channel 456
conv_33 #(D, DATA_WIDTH) x456(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b10111100110100111010010111011100),
.kernel_01(32'b10111100011110111001011110110101),
.kernel_02(32'b00111011101000010001010110010110),
.kernel_03(32'b00111110000100001000110111010001),
.kernel_04(32'b00111110010000001111010010011110),
.kernel_05(32'b00111111000010101010000011011101),
.kernel_06(32'b00111101001111011111101111000000),
.kernel_07(32'b00111100100101110110010101011000),
.kernel_08(32'b00111100110001000011000111010010),
.pxl_out(pxl_out_456), .valid_out(valid_out_456) );

//Channel 457
conv_33 #(D, DATA_WIDTH) x457(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111101001001010011111101101111),
.kernel_01(32'b00111101101010110010011001100101),
.kernel_02(32'b10111110011010101110111010001110),
.kernel_03(32'b00111101000001001111110101111111),
.kernel_04(32'b10111011111110000101101010000011),
.kernel_05(32'b00111100000001010010111111100001),
.kernel_06(32'b00111100101110011011011100010110),
.kernel_07(32'b00111101100000011000001110010111),
.kernel_08(32'b10111100111111111110101110100001),
.pxl_out(pxl_out_457), .valid_out(valid_out_457) );

//Channel 458
conv_33 #(D, DATA_WIDTH) x458(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b10111100101101110010010000110011),
.kernel_01(32'b00111101011011110101010101010100),
.kernel_02(32'b10111100000110010110100001000111),
.kernel_03(32'b00111101001000000100101011111101),
.kernel_04(32'b10111101100011011101111111110101),
.kernel_05(32'b00111101000101010101110000101000),
.kernel_06(32'b00111110101110010110011110100111),
.kernel_07(32'b10111100001101110110011001000111),
.kernel_08(32'b00111100101000111010010001100011),
.pxl_out(pxl_out_458), .valid_out(valid_out_458) );

//Channel 459
conv_33 #(D, DATA_WIDTH) x459(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111100011111010111110011110101),
.kernel_01(32'b00111101100010110111111111000100),
.kernel_02(32'b00111110000001010001100011101010),
.kernel_03(32'b00111110001001100101010111110010),
.kernel_04(32'b00111101010010001000011010101010),
.kernel_05(32'b00111100110100101001101010000101),
.kernel_06(32'b00111011111101100010001001111000),
.kernel_07(32'b10111101001110111001001000001111),
.kernel_08(32'b10111100001101100000000010110101),
.pxl_out(pxl_out_459), .valid_out(valid_out_459) );

//Channel 460
conv_33 #(D, DATA_WIDTH) x460(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b10111100101111010110101110010011),
.kernel_01(32'b00111111001111000110001101011101),
.kernel_02(32'b00111101110110110000011110101111),
.kernel_03(32'b10111101011011111001101110001110),
.kernel_04(32'b00111101100100110010111010110011),
.kernel_05(32'b10111100111100000001011010111000),
.kernel_06(32'b00111100001100011111000110011001),
.kernel_07(32'b10111101100101011010001011011110),
.kernel_08(32'b00111100001101010110101000010101),
.pxl_out(pxl_out_460), .valid_out(valid_out_460) );

//Channel 461
conv_33 #(D, DATA_WIDTH) x461(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b10111100000100001011011010011001),
.kernel_01(32'b10111101000001110101100001110001),
.kernel_02(32'b00111101111100100111010010110000),
.kernel_03(32'b00111101000111010101010110100011),
.kernel_04(32'b00111101000100000110000101010000),
.kernel_05(32'b00111101001000010010101110010100),
.kernel_06(32'b00111100000100011011101000000101),
.kernel_07(32'b10111101011000010110011001000000),
.kernel_08(32'b00111110000110000000101111111100),
.pxl_out(pxl_out_461), .valid_out(valid_out_461) );

//Channel 462
conv_33 #(D, DATA_WIDTH) x462(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111101111110010100110100100101),
.kernel_01(32'b00111101111001110111001101111001),
.kernel_02(32'b00111101100100001101001010001010),
.kernel_03(32'b00111100001000101010010101101000),
.kernel_04(32'b00111101011000011001111000111001),
.kernel_05(32'b00111110000101110010011101001010),
.kernel_06(32'b00111110001101100110110010110011),
.kernel_07(32'b10111100000100001111000100101100),
.kernel_08(32'b00111110000001101011101101010100),
.pxl_out(pxl_out_462), .valid_out(valid_out_462) );

//Channel 463
conv_33 #(D, DATA_WIDTH) x463(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b10111101001011111101001100101110),
.kernel_01(32'b00111001111011000011101111000011),
.kernel_02(32'b00111101001101011000000011010011),
.kernel_03(32'b00111100111101011100010100100111),
.kernel_04(32'b00111101000000101101011100001111),
.kernel_05(32'b00111101110111000110100101101000),
.kernel_06(32'b00111101011110010000001101001000),
.kernel_07(32'b10111101010010110000010111010011),
.kernel_08(32'b10111101001100100100001101000010),
.pxl_out(pxl_out_463), .valid_out(valid_out_463) );

//Channel 464
conv_33 #(D, DATA_WIDTH) x464(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111101000011110000111100000000),
.kernel_01(32'b00111101110111110101000110000001),
.kernel_02(32'b10111011111101000001111010101101),
.kernel_03(32'b00111110000111111000000010000011),
.kernel_04(32'b00111110000000000011111111001011),
.kernel_05(32'b00111110110011000110001111111111),
.kernel_06(32'b00111101001010110101111001010111),
.kernel_07(32'b10111101101101000101100011000110),
.kernel_08(32'b10111101011100111010100010110100),
.pxl_out(pxl_out_464), .valid_out(valid_out_464) );

//Channel 465
conv_33 #(D, DATA_WIDTH) x465(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b00111101110110010110001000000001),
.kernel_01(32'b00111101101111101000101001111011),
.kernel_02(32'b00111101110101111101101000001101),
.kernel_03(32'b00111100100110110110111011000101),
.kernel_04(32'b10111100111010001000010010000111),
.kernel_05(32'b00111101011001110100111000010001),
.kernel_06(32'b10111011111001111000001001100010),
.kernel_07(32'b00111101011000010001001110110001),
.kernel_08(32'b00111100101110000100010101001110),
.pxl_out(pxl_out_465), .valid_out(valid_out_465) );

//Channel 466
conv_33 #(D, DATA_WIDTH) x466(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111100101101000101111111000100),
.kernel_01(32'b10111101001111110001000010000001),
.kernel_02(32'b00111100110001001100100010010000),
.kernel_03(32'b10111101000111110001011100001100),
.kernel_04(32'b00111100101000011011111011100000),
.kernel_05(32'b00111101101000101111011110101001),
.kernel_06(32'b00111101101111001100101101000110),
.kernel_07(32'b00111110001001010011011000001011),
.kernel_08(32'b10111100011011001100011110011001),
.pxl_out(pxl_out_466), .valid_out(valid_out_466) );

//Channel 467
conv_33 #(D, DATA_WIDTH) x467(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111011010110101010111011110100),
.kernel_01(32'b00111101000101100011011100111101),
.kernel_02(32'b00111101010000111011010011110001),
.kernel_03(32'b10111101001000111101000010101100),
.kernel_04(32'b10111101001010101011100100100101),
.kernel_05(32'b00111101011101100011110110110000),
.kernel_06(32'b00111101101010010000100110110010),
.kernel_07(32'b10111100010010111000101110001011),
.kernel_08(32'b00111110000101000111011001010101),
.pxl_out(pxl_out_467), .valid_out(valid_out_467) );

//Channel 468
conv_33 #(D, DATA_WIDTH) x468(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111110100101001100011110001001),
.kernel_01(32'b00111110001000101010010000010010),
.kernel_02(32'b00111101001011110010001111100110),
.kernel_03(32'b10111101110110011010011100001100),
.kernel_04(32'b10111101100100001100000101101100),
.kernel_05(32'b00111110000111111010001101011001),
.kernel_06(32'b00111101100100110101110111100011),
.kernel_07(32'b00111100101010101111110111111101),
.kernel_08(32'b00111110000000010001001000010010),
.pxl_out(pxl_out_468), .valid_out(valid_out_468) );

//Channel 469
conv_33 #(D, DATA_WIDTH) x469(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b10111110001110101000101000110000),
.kernel_01(32'b00111101111010101110011011111011),
.kernel_02(32'b00111100111111110101000111010001),
.kernel_03(32'b00111101101001000010101111101111),
.kernel_04(32'b00111101011101101111000100100101),
.kernel_05(32'b00111101100011100111100010110111),
.kernel_06(32'b10111100001111001011011010111010),
.kernel_07(32'b00111110000111010010101110111000),
.kernel_08(32'b00111101100110100101001100001011),
.pxl_out(pxl_out_469), .valid_out(valid_out_469) );

//Channel 470
conv_33 #(D, DATA_WIDTH) x470(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b00111101010011101010101110101101),
.kernel_01(32'b00111101010011100110100110111100),
.kernel_02(32'b00111101111000111110100010111100),
.kernel_03(32'b00111110000000011010100001101001),
.kernel_04(32'b10111110100111010111100111010100),
.kernel_05(32'b10111101011111110000110010100000),
.kernel_06(32'b00111111000011000000111011100100),
.kernel_07(32'b00111100001001111100010100111101),
.kernel_08(32'b10111101101011000111010110001110),
.pxl_out(pxl_out_470), .valid_out(valid_out_470) );

//Channel 471
conv_33 #(D, DATA_WIDTH) x471(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b00111110111110001111100111100111),
.kernel_01(32'b00111110011001001011100101011101),
.kernel_02(32'b00111110101110110101010011100011),
.kernel_03(32'b00111101010000010100111001111101),
.kernel_04(32'b00111110010111001001011111010111),
.kernel_05(32'b10111101111100111000000101011000),
.kernel_06(32'b00111101000101011001101110001010),
.kernel_07(32'b00111110100010111011000011101001),
.kernel_08(32'b10111110100001111100000010001001),
.pxl_out(pxl_out_471), .valid_out(valid_out_471) );

//Channel 472
conv_33 #(D, DATA_WIDTH) x472(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b10111101010100011111100101100111),
.kernel_01(32'b10111110101101100010000011100100),
.kernel_02(32'b10111101001000101100011001001001),
.kernel_03(32'b10111110000110011101011010000011),
.kernel_04(32'b00111110011111011010101001101001),
.kernel_05(32'b10111101111001011000011000110010),
.kernel_06(32'b10111110101001010000101001101101),
.kernel_07(32'b10111110000001000101010001100101),
.kernel_08(32'b00111101110100101101010101101011),
.pxl_out(pxl_out_472), .valid_out(valid_out_472) );

//Channel 473
conv_33 #(D, DATA_WIDTH) x473(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111100110111110110100000000010),
.kernel_01(32'b10111101100101011101000000100001),
.kernel_02(32'b10111101111011100111010111101110),
.kernel_03(32'b10111101101010100110101010110101),
.kernel_04(32'b10111110100110100110000111001101),
.kernel_05(32'b10111101101100111001100111101111),
.kernel_06(32'b10111101101010011001001011101010),
.kernel_07(32'b00111101101101100011110101001110),
.kernel_08(32'b10111101110100100000101010110100),
.pxl_out(pxl_out_473), .valid_out(valid_out_473) );

//Channel 474
conv_33 #(D, DATA_WIDTH) x474(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111110110110110100011011000011),
.kernel_01(32'b10111101011011110100111000001110),
.kernel_02(32'b00111110101001100110111001001110),
.kernel_03(32'b00111101011110010100011000010001),
.kernel_04(32'b00111110011100000010001111100100),
.kernel_05(32'b10111110000111001110100011011010),
.kernel_06(32'b10111010100000101001001100111101),
.kernel_07(32'b10111101010111111011011100001001),
.kernel_08(32'b00111110000111101011011100110011),
.pxl_out(pxl_out_474), .valid_out(valid_out_474) );

//Channel 475
conv_33 #(D, DATA_WIDTH) x475(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b10111111000011010001100000111111),
.kernel_01(32'b10111101010100000101110000010110),
.kernel_02(32'b10111101101110101110000011101100),
.kernel_03(32'b10111101000110000010100100011101),
.kernel_04(32'b00111110100111101101101100010000),
.kernel_05(32'b00111101100101001111010111011101),
.kernel_06(32'b10111111010001010001101000011111),
.kernel_07(32'b10111110000011111110001000000001),
.kernel_08(32'b00111110001000000110110011010110),
.pxl_out(pxl_out_475), .valid_out(valid_out_475) );

//Channel 476
conv_33 #(D, DATA_WIDTH) x476(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111101001101111001111110110100),
.kernel_01(32'b10111101010101110101100001011000),
.kernel_02(32'b00111011100001011011101110100011),
.kernel_03(32'b00111110100101100100101100110100),
.kernel_04(32'b10111110100000010111000110101011),
.kernel_05(32'b10111110011111100101101111000000),
.kernel_06(32'b00111101011011101111100101100010),
.kernel_07(32'b00111110011101101000111111010010),
.kernel_08(32'b10111101000000011010010001001010),
.pxl_out(pxl_out_476), .valid_out(valid_out_476) );

//Channel 477
conv_33 #(D, DATA_WIDTH) x477(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111110001100000010111000110011),
.kernel_01(32'b00111110010111110111110111010000),
.kernel_02(32'b10111110011001000010101101011000),
.kernel_03(32'b10111101001110101101000110110110),
.kernel_04(32'b00111100101000110100011010000000),
.kernel_05(32'b00111011100000001001100001100000),
.kernel_06(32'b00111101000001110001001000010101),
.kernel_07(32'b00111101010010111111101101000110),
.kernel_08(32'b00111101010000011100011101001000),
.pxl_out(pxl_out_477), .valid_out(valid_out_477) );

//Channel 478
conv_33 #(D, DATA_WIDTH) x478(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b00111101011100000111001000100010),
.kernel_01(32'b10111101111111001100011011011001),
.kernel_02(32'b00111101100000010111001100011100),
.kernel_03(32'b00111101011000101110111101001000),
.kernel_04(32'b00111101100001000100000100000100),
.kernel_05(32'b10111101111001101101111010101000),
.kernel_06(32'b00111110011110011001111000111111),
.kernel_07(32'b00111110000100111011000101111000),
.kernel_08(32'b10111101010010000110001010011011),
.pxl_out(pxl_out_478), .valid_out(valid_out_478) );

//Channel 479
conv_33 #(D, DATA_WIDTH) x479(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b00111110101001010111001111111111),
.kernel_01(32'b00111101000010010101101101000110),
.kernel_02(32'b00111101110010111100011000100010),
.kernel_03(32'b00111101110101100101110001000000),
.kernel_04(32'b10111101001100000011100101110011),
.kernel_05(32'b10111100111110111110101110101010),
.kernel_06(32'b10111101011011110011010110110110),
.kernel_07(32'b00111101010111110001110100010101),
.kernel_08(32'b00111101111000000111100100111000),
.pxl_out(pxl_out_479), .valid_out(valid_out_479) );

//Channel 480
conv_33 #(D, DATA_WIDTH) x480(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b00111100001100010000011011011010),
.kernel_01(32'b00111101001000110000000101101001),
.kernel_02(32'b00111101110100000000111100111011),
.kernel_03(32'b00111101101110110000010110101011),
.kernel_04(32'b10111100001110100010110001011011),
.kernel_05(32'b00111101101001100001100110100101),
.kernel_06(32'b00111100100010011001011111111100),
.kernel_07(32'b10111011101001000100110001001011),
.kernel_08(32'b10111011001101100111011101101011),
.pxl_out(pxl_out_480), .valid_out(valid_out_480) );

//Channel 481
conv_33 #(D, DATA_WIDTH) x481(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111100100110111100101111111000),
.kernel_01(32'b00111101111001001000110011111110),
.kernel_02(32'b10111101101010011001010000001000),
.kernel_03(32'b10111101101110101111010111111000),
.kernel_04(32'b10111100110000001101110111000001),
.kernel_05(32'b10111101001100101000101011111110),
.kernel_06(32'b00111100110011101100001010110101),
.kernel_07(32'b00111011100000010110010011001101),
.kernel_08(32'b00111101011101111001101111110110),
.pxl_out(pxl_out_481), .valid_out(valid_out_481) );

//Channel 482
conv_33 #(D, DATA_WIDTH) x482(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b00111100111100100111011011001110),
.kernel_01(32'b10111101011110000001001000100001),
.kernel_02(32'b10111100111110000010111110110110),
.kernel_03(32'b00111101111000001110110110111111),
.kernel_04(32'b00111101100110101100000001110100),
.kernel_05(32'b00111001100100011010111011101000),
.kernel_06(32'b10111101010001000101001000000111),
.kernel_07(32'b10111100110111100111010010101101),
.kernel_08(32'b10111110011010100111110111101000),
.pxl_out(pxl_out_482), .valid_out(valid_out_482) );

//Channel 483
conv_33 #(D, DATA_WIDTH) x483(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111101000010101001110111111010),
.kernel_01(32'b10111100111001001011011110011110),
.kernel_02(32'b10111101100111010000001101100110),
.kernel_03(32'b00111101011100101000100001110010),
.kernel_04(32'b10111101010001010111110110101101),
.kernel_05(32'b10111101011100111001011111001111),
.kernel_06(32'b10111101111010011001111001010100),
.kernel_07(32'b10111100101100111111001101100000),
.kernel_08(32'b10111100100101110111101010110001),
.pxl_out(pxl_out_483), .valid_out(valid_out_483) );

//Channel 484
conv_33 #(D, DATA_WIDTH) x484(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b10111101001001010011000010101100),
.kernel_01(32'b00111101111111110010001101101011),
.kernel_02(32'b10111110011100110110000111010101),
.kernel_03(32'b00111100110001010001101100011110),
.kernel_04(32'b00111101110011011001101101110011),
.kernel_05(32'b10111100010011001100111000111101),
.kernel_06(32'b10111101101001110111111101010100),
.kernel_07(32'b00111100000001111101110010011011),
.kernel_08(32'b10111110000011111010100000011101),
.pxl_out(pxl_out_484), .valid_out(valid_out_484) );

//Channel 485
conv_33 #(D, DATA_WIDTH) x485(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111110111101011100110000101101),
.kernel_01(32'b10111011111010101111000000000100),
.kernel_02(32'b10111100101001101001110011010000),
.kernel_03(32'b00111101111001101001010111111010),
.kernel_04(32'b10111101100101000001101110010000),
.kernel_05(32'b00111100100110110010011111010111),
.kernel_06(32'b00111011110001000110110001100011),
.kernel_07(32'b10111101001000001011000101010111),
.kernel_08(32'b00111100101101011100010110100100),
.pxl_out(pxl_out_485), .valid_out(valid_out_485) );

//Channel 486
conv_33 #(D, DATA_WIDTH) x486(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b10111100000001000011001000010001),
.kernel_01(32'b10111101000111001001001001110111),
.kernel_02(32'b00111110001010101100011001001100),
.kernel_03(32'b10111101011110011100111111001001),
.kernel_04(32'b00111100110111100111111010111001),
.kernel_05(32'b00111100100000111011101111000001),
.kernel_06(32'b00111011010000010100011011111101),
.kernel_07(32'b00111101100001100011110101111011),
.kernel_08(32'b10111100001001000111001110001000),
.pxl_out(pxl_out_486), .valid_out(valid_out_486) );

//Channel 487
conv_33 #(D, DATA_WIDTH) x487(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b00111101001011000100000111110001),
.kernel_01(32'b10111101100011110111111010100101),
.kernel_02(32'b00111101001101011000001001101001),
.kernel_03(32'b10111100010110001101101001101000),
.kernel_04(32'b00111101110111101101100010111100),
.kernel_05(32'b10111101101111001110001010100010),
.kernel_06(32'b00111101001001000011101100100010),
.kernel_07(32'b10111011011000000101101011100000),
.kernel_08(32'b10111100111111001000011011000111),
.pxl_out(pxl_out_487), .valid_out(valid_out_487) );

//Channel 488
conv_33 #(D, DATA_WIDTH) x488(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111101000101001010110001111011),
.kernel_01(32'b10111110001101001000111101100010),
.kernel_02(32'b00111110110111001010000010010101),
.kernel_03(32'b00111110001010010101100101101110),
.kernel_04(32'b00111111001101100110010110011101),
.kernel_05(32'b00111011011000110110010010010000),
.kernel_06(32'b10111110000100010101110111100110),
.kernel_07(32'b10111110100001100010110011001111),
.kernel_08(32'b00111101001101101111101110100100),
.pxl_out(pxl_out_488), .valid_out(valid_out_488) );

//Channel 489
conv_33 #(D, DATA_WIDTH) x489(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b00111110010010001001011100111011),
.kernel_01(32'b00111110100010000100001011100010),
.kernel_02(32'b10111101111111111010001101001101),
.kernel_03(32'b10111101110110010011100011010110),
.kernel_04(32'b10111101001101001100001110000101),
.kernel_05(32'b10111101101110111000101001111011),
.kernel_06(32'b10111110100010110011011000011101),
.kernel_07(32'b10111100100110010111001000110011),
.kernel_08(32'b00111110010000011000000000011100),
.pxl_out(pxl_out_489), .valid_out(valid_out_489) );

//Channel 490
conv_33 #(D, DATA_WIDTH) x490(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b10111110010000111101010000001011),
.kernel_01(32'b00111101000011010100111101000000),
.kernel_02(32'b10111110000101010101001110110010),
.kernel_03(32'b10111101111000111001101000000111),
.kernel_04(32'b00111110001100011110001101100001),
.kernel_05(32'b10111110001000010100001001010001),
.kernel_06(32'b00111111011001011000001010010101),
.kernel_07(32'b10111110000011100101001010111001),
.kernel_08(32'b00111101111101010100101111001011),
.pxl_out(pxl_out_490), .valid_out(valid_out_490) );

//Channel 491
conv_33 #(D, DATA_WIDTH) x491(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111110110111001101101001110010),
.kernel_01(32'b00111110000101011000001000001111),
.kernel_02(32'b00111110111100100101101101001011),
.kernel_03(32'b00111101011000011010100101110010),
.kernel_04(32'b00111110100110001110101111111011),
.kernel_05(32'b10111101000101010001010101100001),
.kernel_06(32'b10111101011010100011011010011111),
.kernel_07(32'b00111101000100000100110110000000),
.kernel_08(32'b00111110000000001110110010010000),
.pxl_out(pxl_out_491), .valid_out(valid_out_491) );

//Channel 492
conv_33 #(D, DATA_WIDTH) x492(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111101110101001100010010110001),
.kernel_01(32'b00111100100111010011001110110001),
.kernel_02(32'b10111101010101100001000101100110),
.kernel_03(32'b10111100100000000110011010001010),
.kernel_04(32'b00111101011110101010010100001001),
.kernel_05(32'b00111101110001001100011110111111),
.kernel_06(32'b00111101101011010110111010110000),
.kernel_07(32'b00111110010000100010001110000010),
.kernel_08(32'b00111110000011110010111000000101),
.pxl_out(pxl_out_492), .valid_out(valid_out_492) );

//Channel 493
conv_33 #(D, DATA_WIDTH) x493(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111110101010101010110011011111),
.kernel_01(32'b00111101011011001000100001000101),
.kernel_02(32'b00111100010110001010001000101001),
.kernel_03(32'b00111101101001111100101110010100),
.kernel_04(32'b10111110001100010110100000100011),
.kernel_05(32'b00111110000010001111010011000110),
.kernel_06(32'b00111101011011100110101101111100),
.kernel_07(32'b00111101111001101100000100110000),
.kernel_08(32'b10111101100000100110101111000000),
.pxl_out(pxl_out_493), .valid_out(valid_out_493) );

//Channel 494
conv_33 #(D, DATA_WIDTH) x494(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b10111110000100111101011100000001),
.kernel_01(32'b10111101011101111001111000101100),
.kernel_02(32'b00111101000010001001001100100011),
.kernel_03(32'b00111100000101111001010000011000),
.kernel_04(32'b00111100101010111010001111010010),
.kernel_05(32'b10111101111000101001011010101111),
.kernel_06(32'b10111110010011100110011000111110),
.kernel_07(32'b00111100110010111010001101010100),
.kernel_08(32'b00111101000100101010100110101100),
.pxl_out(pxl_out_494), .valid_out(valid_out_494) );

//Channel 495
conv_33 #(D, DATA_WIDTH) x495(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111101010100111011111110100101),
.kernel_01(32'b10111101100001101110101001011100),
.kernel_02(32'b00111101100011101001011010111000),
.kernel_03(32'b00111100001111011111001101110010),
.kernel_04(32'b00111101011001001000100110010100),
.kernel_05(32'b10111101101100000011010101101111),
.kernel_06(32'b10111100001110110000101011101101),
.kernel_07(32'b10111101110110001101101111100010),
.kernel_08(32'b00111101110100001011010000010101),
.pxl_out(pxl_out_495), .valid_out(valid_out_495) );

//Channel 496
conv_33 #(D, DATA_WIDTH) x496(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111110100001100001010110100101),
.kernel_01(32'b10111101111000011011110100011011),
.kernel_02(32'b10111101100101111001101101011000),
.kernel_03(32'b10111110010010100110011110111110),
.kernel_04(32'b10111110000011000110010111101101),
.kernel_05(32'b10111101111111101100100101101010),
.kernel_06(32'b00111101011000111111000001110000),
.kernel_07(32'b10111101001000010110010001010001),
.kernel_08(32'b00111111000100001001000000110000),
.pxl_out(pxl_out_496), .valid_out(valid_out_496) );

//Channel 497
conv_33 #(D, DATA_WIDTH) x497(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111101101111001110111011100110),
.kernel_01(32'b00111101100101000001011010000001),
.kernel_02(32'b10111101100010000100101000100101),
.kernel_03(32'b10111110010101000001011101110010),
.kernel_04(32'b00111110000010110101110111010111),
.kernel_05(32'b00111100011100011011111000001001),
.kernel_06(32'b00111100001100000110110001111111),
.kernel_07(32'b10111101000001101010000011000010),
.kernel_08(32'b00111110001100100101100011101100),
.pxl_out(pxl_out_497), .valid_out(valid_out_497) );

//Channel 498
conv_33 #(D, DATA_WIDTH) x498(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111111001010011010001100000001),
.kernel_01(32'b00111101001101111011100111100011),
.kernel_02(32'b10111101011001010101100001100101),
.kernel_03(32'b00111110101000001011000001100011),
.kernel_04(32'b10111101110001000010000010100100),
.kernel_05(32'b00111010100111101001100000001001),
.kernel_06(32'b10111111001000110110001000010010),
.kernel_07(32'b10111110011000100000011100001001),
.kernel_08(32'b10111110001011101110001111111000),
.pxl_out(pxl_out_498), .valid_out(valid_out_498) );

//Channel 499
conv_33 #(D, DATA_WIDTH) x499(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111101010101111001010101000010),
.kernel_01(32'b10111100110000100101101000101001),
.kernel_02(32'b00111100110001000011111101111011),
.kernel_03(32'b10111110000100101010110101000100),
.kernel_04(32'b10111110100001010010011001010010),
.kernel_05(32'b00111101111101100111001010001111),
.kernel_06(32'b00111101011011001000110010101100),
.kernel_07(32'b00111110001110101110111100001000),
.kernel_08(32'b10111100111011110010101001101100),
.pxl_out(pxl_out_499), .valid_out(valid_out_499) );

//Channel 500
conv_33 #(D, DATA_WIDTH) x500(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111011110011100010100001100001),
.kernel_01(32'b00111100001101101101100100110100),
.kernel_02(32'b10111101111010011111100101110000),
.kernel_03(32'b00111110001000010010010110001100),
.kernel_04(32'b10111101010000100101011111010000),
.kernel_05(32'b10111110011110000111001011101100),
.kernel_06(32'b10111100001000110000011001111110),
.kernel_07(32'b10111100100000110000001100010011),
.kernel_08(32'b10111100100001110100101001010011),
.pxl_out(pxl_out_500), .valid_out(valid_out_500) );

//Channel 501
conv_33 #(D, DATA_WIDTH) x501(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b10111101111110001110110111100111),
.kernel_01(32'b10111110110011011001110101110110),
.kernel_02(32'b10111110011101001101001101101101),
.kernel_03(32'b10111101110111011111101111011101),
.kernel_04(32'b00111100101001100110010100001001),
.kernel_05(32'b10111110010010001111011101100001),
.kernel_06(32'b10111110000000100000111111001011),
.kernel_07(32'b10111111000010111111110010111010),
.kernel_08(32'b00111110101000011100001000100110),
.pxl_out(pxl_out_501), .valid_out(valid_out_501) );

//Channel 502
conv_33 #(D, DATA_WIDTH) x502(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b00111011110011100000111110101010),
.kernel_01(32'b10111101010001101101110010001001),
.kernel_02(32'b00111101010111010000110101000000),
.kernel_03(32'b10111101101000011110000100101100),
.kernel_04(32'b10111110010011001101011110111001),
.kernel_05(32'b10111110111010001011111010110100),
.kernel_06(32'b10111111001110111101110001000110),
.kernel_07(32'b00111101001010100001000100111100),
.kernel_08(32'b10111101010110110100000100100010),
.pxl_out(pxl_out_502), .valid_out(valid_out_502) );

//Channel 503
conv_33 #(D, DATA_WIDTH) x503(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111110011011110011101111000100),
.kernel_01(32'b00111101011010101100000011010101),
.kernel_02(32'b10111101101010110010110111011100),
.kernel_03(32'b10111110001011111111001000010100),
.kernel_04(32'b00111111000100111010100000100011),
.kernel_05(32'b00111101110111010101110010101110),
.kernel_06(32'b10111101011110011100011011101101),
.kernel_07(32'b10111101110001111010110000011000),
.kernel_08(32'b00111101111110111101111000101011),
.pxl_out(pxl_out_503), .valid_out(valid_out_503) );

//Channel 504
conv_33 #(D, DATA_WIDTH) x504(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111001111100111001000101100000),
.kernel_01(32'b00111110000011011111111010010010),
.kernel_02(32'b00111110110001010110000101011000),
.kernel_03(32'b10111110001110111110010000100100),
.kernel_04(32'b00111110100110111110011101101011),
.kernel_05(32'b00111110000010001010011110011000),
.kernel_06(32'b10111110011000001111101001101001),
.kernel_07(32'b00111101110000100111111011001011),
.kernel_08(32'b10111111010001111101111100111011),
.pxl_out(pxl_out_504), .valid_out(valid_out_504) );

//Channel 505
conv_33 #(D, DATA_WIDTH) x505(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111110110100011111100010101001),
.kernel_01(32'b10111101101001011010100100011100),
.kernel_02(32'b00111110001001011000110110110111),
.kernel_03(32'b10111110001111101001000010000100),
.kernel_04(32'b10111110111100110101100001111000),
.kernel_05(32'b10111110001010101010001010100100),
.kernel_06(32'b10111110110011100001111010110010),
.kernel_07(32'b00111101011000110000111100101100),
.kernel_08(32'b00111100010101001101001110100000),
.pxl_out(pxl_out_505), .valid_out(valid_out_505) );

//Channel 506
conv_33 #(D, DATA_WIDTH) x506(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111101001010110101110000010100),
.kernel_01(32'b10111010100101101001010010110001),
.kernel_02(32'b10111101011111010000110100101111),
.kernel_03(32'b00111110110011101100100000100100),
.kernel_04(32'b10111100101100111011100111110010),
.kernel_05(32'b10111101101001100111100010100100),
.kernel_06(32'b00111100110000011110010110010111),
.kernel_07(32'b10111100010111011111001011001010),
.kernel_08(32'b10111011010111111011001010110010),
.pxl_out(pxl_out_506), .valid_out(valid_out_506) );

//Channel 507
conv_33 #(D, DATA_WIDTH) x507(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111101101100010110101110010110),
.kernel_01(32'b00111011100011110101010101110101),
.kernel_02(32'b00111011100011011011011101110000),
.kernel_03(32'b10111101000001101100000111010101),
.kernel_04(32'b00111101000011011010101011000001),
.kernel_05(32'b10111100111110100101110101000100),
.kernel_06(32'b00111101001010011010101110111010),
.kernel_07(32'b00111101110100001010100100111111),
.kernel_08(32'b00111100111101111101001010110011),
.pxl_out(pxl_out_507), .valid_out(valid_out_507) );

//Channel 508
conv_33 #(D, DATA_WIDTH) x508(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111101101101101100110000010010),
.kernel_01(32'b00111101001111001110110010011100),
.kernel_02(32'b10111100100101000010111001100100),
.kernel_03(32'b10111100010100101110010001101100),
.kernel_04(32'b00111011111011000001100100101010),
.kernel_05(32'b00111100111110101101101010111011),
.kernel_06(32'b10111100110110001010100011100010),
.kernel_07(32'b00111100101011000001100010101110),
.kernel_08(32'b10111100110001011010001010010100),
.pxl_out(pxl_out_508), .valid_out(valid_out_508) );

//Channel 509
conv_33 #(D, DATA_WIDTH) x509(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b10111101011110111110010110100001),
.kernel_01(32'b10111100101101111001101001011011),
.kernel_02(32'b10111101011101101100111011011100),
.kernel_03(32'b00111101110110111001101011011101),
.kernel_04(32'b00111101100101011111011100010001),
.kernel_05(32'b00111101000011001111011000001011),
.kernel_06(32'b10111101001101001000011010100110),
.kernel_07(32'b00111100110100011101001101110111),
.kernel_08(32'b10111011101110000011000110101001),
.pxl_out(pxl_out_509), .valid_out(valid_out_509) );

//Channel 510
conv_33 #(D, DATA_WIDTH) x510(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111101101101110011111101101100),
.kernel_01(32'b00111101000110011001101011111101),
.kernel_02(32'b10111101100100111010111111001110),
.kernel_03(32'b00111101000011000011001000011100),
.kernel_04(32'b00111010001000000110110000100011),
.kernel_05(32'b00111101111010001010011000110000),
.kernel_06(32'b00111100011100000000111111001000),
.kernel_07(32'b00111100110011110111000001000100),
.kernel_08(32'b00111100010100110111110101101011),
.pxl_out(pxl_out_510), .valid_out(valid_out_510) );

//Channel 511
conv_33 #(D, DATA_WIDTH) x511(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111101111011010001010111010011),
.kernel_01(32'b00111110101010000000001000100001),
.kernel_02(32'b00111110101110000101000000110111),
.kernel_03(32'b10111011100110110000100100011111),
.kernel_04(32'b10111101101101010100010100110000),
.kernel_05(32'b10111101110010101000001010000101),
.kernel_06(32'b10111101101100010110001100001000),
.kernel_07(32'b00111110101010001110101001111110),
.kernel_08(32'b10111100010101111110010011000000),
.pxl_out(pxl_out_511), .valid_out(valid_out_511) );

//Channel 512
conv_33 #(D, DATA_WIDTH) x512(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111101010111000001101000100011),
.kernel_01(32'b00111101111100110100110111010111),
.kernel_02(32'b10111110000001101010111111110100),
.kernel_03(32'b10111110001100101100010110110100),
.kernel_04(32'b10111101001000001001000110111100),
.kernel_05(32'b00111100011001100111111011000101),
.kernel_06(32'b10111101001000101111100010001100),
.kernel_07(32'b00111101100100001110111000010110),
.kernel_08(32'b00111110000011011110111101101100),
.pxl_out(pxl_out_512), .valid_out(valid_out_512) );

//Channel 513
conv_33 #(D, DATA_WIDTH) x513(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111101000010110111011101010001),
.kernel_01(32'b10111010010110101001101101110001),
.kernel_02(32'b00111101110010001101010011000100),
.kernel_03(32'b10111101100001110111011110100011),
.kernel_04(32'b10111110001011011011000010001011),
.kernel_05(32'b10111101101000101011110000101000),
.kernel_06(32'b00111101101100100110000000010100),
.kernel_07(32'b10111100110010011011110111010001),
.kernel_08(32'b10111101000000101010110000000110),
.pxl_out(pxl_out_513), .valid_out(valid_out_513) );

//Channel 514
conv_33 #(D, DATA_WIDTH) x514(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111101110010110110010111100110),
.kernel_01(32'b10111110101010000110101000110101),
.kernel_02(32'b10111101110100011001100011101001),
.kernel_03(32'b10111101101100010101101111110100),
.kernel_04(32'b00111100110100001110110001110100),
.kernel_05(32'b00111100010010001001110010100111),
.kernel_06(32'b00111111010011101010001011001101),
.kernel_07(32'b10111110011100000101001100110001),
.kernel_08(32'b10111011110100000100001111010100),
.pxl_out(pxl_out_514), .valid_out(valid_out_514) );

//Channel 515
conv_33 #(D, DATA_WIDTH) x515(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b10111101011011001001010011001110),
.kernel_01(32'b00111101001001001001101000101110),
.kernel_02(32'b00111100110111100100110001010001),
.kernel_03(32'b10111101010100110000010001101011),
.kernel_04(32'b10111101100011111100100011100101),
.kernel_05(32'b00111110000001110011101001110010),
.kernel_06(32'b00111101000011010111100000011010),
.kernel_07(32'b10111111000010010001100101110010),
.kernel_08(32'b10111100000111010011101000110010),
.pxl_out(pxl_out_515), .valid_out(valid_out_515) );

//Channel 516
conv_33 #(D, DATA_WIDTH) x516(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b10111100101111011001011110010101),
.kernel_01(32'b00111110101100100000110111100001),
.kernel_02(32'b10111100110010001000111000111011),
.kernel_03(32'b00111101100001000011000010010010),
.kernel_04(32'b00111110101000111101110010101100),
.kernel_05(32'b10111110001110001000100110011010),
.kernel_06(32'b00111100111011100110111110000100),
.kernel_07(32'b10111110001011111100101011001000),
.kernel_08(32'b00111100011101000011010111001110),
.pxl_out(pxl_out_516), .valid_out(valid_out_516) );

//Channel 517
conv_33 #(D, DATA_WIDTH) x517(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b10111101100111000100001110011000),
.kernel_01(32'b10111101101010001110001110011001),
.kernel_02(32'b10111110101111101000000100001101),
.kernel_03(32'b00111101001011010111100010110101),
.kernel_04(32'b00111110001101010000100011110010),
.kernel_05(32'b00111101110100111100000010011011),
.kernel_06(32'b00111110100011000110101001101000),
.kernel_07(32'b10111101001100001001000101101110),
.kernel_08(32'b10111101110110000110110110010011),
.pxl_out(pxl_out_517), .valid_out(valid_out_517) );

//Channel 518
conv_33 #(D, DATA_WIDTH) x518(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b10111101100010011000000101010100),
.kernel_01(32'b00111101100001100101101111110011),
.kernel_02(32'b00111101010000011010001011110010),
.kernel_03(32'b10111100101000000101010001101100),
.kernel_04(32'b10111011111010100111011111111011),
.kernel_05(32'b00111101010001100100100001000110),
.kernel_06(32'b10111100001100110110010000100000),
.kernel_07(32'b00111100010110111101011111101000),
.kernel_08(32'b10111111000000001010000000100111),
.pxl_out(pxl_out_518), .valid_out(valid_out_518) );

//Channel 519
conv_33 #(D, DATA_WIDTH) x519(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b00111101101100101011110100000000),
.kernel_01(32'b00111011100100111001001000100100),
.kernel_02(32'b00111101101101110000111100001000),
.kernel_03(32'b10111101000111101111101110010111),
.kernel_04(32'b10111011110101010011001011000000),
.kernel_05(32'b10111110011001110100100111001100),
.kernel_06(32'b00111100111110101010101101111010),
.kernel_07(32'b10111110101000000000000011001110),
.kernel_08(32'b10111101101011001001110100110001),
.pxl_out(pxl_out_519), .valid_out(valid_out_519) );

//Channel 520
conv_33 #(D, DATA_WIDTH) x520(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b10111101100100111110101110100011),
.kernel_01(32'b00111101101101101111101000011100),
.kernel_02(32'b00111010110101010001100010110001),
.kernel_03(32'b10111101001011111100001011111111),
.kernel_04(32'b00111011000001000101111000000111),
.kernel_05(32'b00111011011000101000010000011100),
.kernel_06(32'b10111101101101011000000010110100),
.kernel_07(32'b00111101110110000110111111100101),
.kernel_08(32'b10111010100011110011110110001100),
.pxl_out(pxl_out_520), .valid_out(valid_out_520) );

//Channel 521
conv_33 #(D, DATA_WIDTH) x521(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b00111101100110010100100101001000),
.kernel_01(32'b10111100001101100000110010001001),
.kernel_02(32'b00111110010110101011000011110001),
.kernel_03(32'b10111101100110110101101000100011),
.kernel_04(32'b10111110000010000111110011000011),
.kernel_05(32'b00111100101100001000101111110011),
.kernel_06(32'b10111110010010111010010010111001),
.kernel_07(32'b10111110100010100101011101100110),
.kernel_08(32'b00111110101110100111011111010000),
.pxl_out(pxl_out_521), .valid_out(valid_out_521) );

//Channel 522
conv_33 #(D, DATA_WIDTH) x522(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111101101110001111010100110001),
.kernel_01(32'b10111101101010110111111101101101),
.kernel_02(32'b00111110001000101001100110011011),
.kernel_03(32'b10111101011111001111000010011111),
.kernel_04(32'b00111110101010011010101000001010),
.kernel_05(32'b10111101100010011100111110111001),
.kernel_06(32'b10111110100010001111000011011011),
.kernel_07(32'b00111110010001111100100010010011),
.kernel_08(32'b10111110100100011110110001111101),
.pxl_out(pxl_out_522), .valid_out(valid_out_522) );

//Channel 523
conv_33 #(D, DATA_WIDTH) x523(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111101100110101000011011110110),
.kernel_01(32'b10111110000100100010000100010011),
.kernel_02(32'b00111100000111011101011111111011),
.kernel_03(32'b10111110011110100011100111100100),
.kernel_04(32'b00111100011000101100100111011101),
.kernel_05(32'b00111110100001001110110101110010),
.kernel_06(32'b00111100111011001011110110110010),
.kernel_07(32'b10111110000101000010011011111111),
.kernel_08(32'b00111101101001110100100110001110),
.pxl_out(pxl_out_523), .valid_out(valid_out_523) );

//Channel 524
conv_33 #(D, DATA_WIDTH) x524(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b10111110001010111010100010100011),
.kernel_01(32'b00111110110001111010110111101101),
.kernel_02(32'b00111110001001010100101111011001),
.kernel_03(32'b10111101011101111111010001000100),
.kernel_04(32'b00111101011011111010000101001010),
.kernel_05(32'b10111110000001100110100100011110),
.kernel_06(32'b00111100011001000100000011011000),
.kernel_07(32'b10111101101011010111100011000001),
.kernel_08(32'b00111101100011100011111011111111),
.pxl_out(pxl_out_524), .valid_out(valid_out_524) );

//Channel 525
conv_33 #(D, DATA_WIDTH) x525(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111100101000111011110010111110),
.kernel_01(32'b10111100010111000001010001111110),
.kernel_02(32'b00111101101011101100111111100101),
.kernel_03(32'b00111101111000101101011111100010),
.kernel_04(32'b10111110100100011110100000101101),
.kernel_05(32'b00111101100110100111110110101001),
.kernel_06(32'b00111100101000110001101001110100),
.kernel_07(32'b00111110000110001000000011101100),
.kernel_08(32'b00111100110010111100100101000001),
.pxl_out(pxl_out_525), .valid_out(valid_out_525) );

//Channel 526
conv_33 #(D, DATA_WIDTH) x526(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b10111100100011001010110000110100),
.kernel_01(32'b00111110000010111011010001001001),
.kernel_02(32'b00111100011011001100111001101100),
.kernel_03(32'b10111101000101100001010101011111),
.kernel_04(32'b00111100010001110011010011111010),
.kernel_05(32'b00111110100010001011110111011110),
.kernel_06(32'b00111101100011010111010101100010),
.kernel_07(32'b00111011111001011011100100001000),
.kernel_08(32'b00111110000100010001110000011001),
.pxl_out(pxl_out_526), .valid_out(valid_out_526) );

//Channel 527
conv_33 #(D, DATA_WIDTH) x527(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b10111101100001010001100001000001),
.kernel_01(32'b00111101111100110110111000110011),
.kernel_02(32'b10111011010010010100011000100101),
.kernel_03(32'b10111101100010000100010110011110),
.kernel_04(32'b00111101110111011010011110011101),
.kernel_05(32'b00111100110101101000100111100110),
.kernel_06(32'b00111111001110010011000000100010),
.kernel_07(32'b00111101011100001100010101101101),
.kernel_08(32'b00111100111111001101000101111110),
.pxl_out(pxl_out_527), .valid_out(valid_out_527) );

//Channel 528
conv_33 #(D, DATA_WIDTH) x528(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111101101010101001011100001000),
.kernel_01(32'b10111100110100011101011101110111),
.kernel_02(32'b00111101000011000001011101110011),
.kernel_03(32'b10111110000010001011111011001101),
.kernel_04(32'b00111101000000111100101010111110),
.kernel_05(32'b00111100001100000001101001001111),
.kernel_06(32'b00111011010000101010010101101010),
.kernel_07(32'b10111100111000100010001111101010),
.kernel_08(32'b00111101000000010000111010010001),
.pxl_out(pxl_out_528), .valid_out(valid_out_528) );

//Channel 529
conv_33 #(D, DATA_WIDTH) x529(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111110001110000010100000111010),
.kernel_01(32'b00111100101100100101101101111001),
.kernel_02(32'b10111101011010010110010010010101),
.kernel_03(32'b00111110000100100011110011101100),
.kernel_04(32'b00111011111101001011011000100000),
.kernel_05(32'b10111101000001100000001010111100),
.kernel_06(32'b00111100010010011011100011110110),
.kernel_07(32'b00111101101001010000011110101001),
.kernel_08(32'b00111100100111001100001000000011),
.pxl_out(pxl_out_529), .valid_out(valid_out_529) );

//Channel 530
conv_33 #(D, DATA_WIDTH) x530(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111011100001111001001101011101),
.kernel_01(32'b00111100110111010111000000101001),
.kernel_02(32'b00111101100100100100100101001011),
.kernel_03(32'b00111101101100110111011110111111),
.kernel_04(32'b00111101100000110100111101100011),
.kernel_05(32'b10111100100100111000110010000110),
.kernel_06(32'b10111101010101001101101110000001),
.kernel_07(32'b10111101110110011010001000111111),
.kernel_08(32'b10111110100001000100111110000101),
.pxl_out(pxl_out_530), .valid_out(valid_out_530) );

//Channel 531
conv_33 #(D, DATA_WIDTH) x531(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111100111111011011010111100010),
.kernel_01(32'b10111110101110010000001100000100),
.kernel_02(32'b10111101101011010010100100000001),
.kernel_03(32'b00111110001011111100010001011011),
.kernel_04(32'b10111110110101010000000011111111),
.kernel_05(32'b00111011100000111110011001110100),
.kernel_06(32'b10111110010000001000101010010110),
.kernel_07(32'b00111100100110101010001001010110),
.kernel_08(32'b10111110100010100101100100111100),
.pxl_out(pxl_out_531), .valid_out(valid_out_531) );

//Channel 532
conv_33 #(D, DATA_WIDTH) x532(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111110011111011101101001011011),
.kernel_01(32'b10111101011000100111000110101000),
.kernel_02(32'b10111110001000000100100001101001),
.kernel_03(32'b00111110100111101001010001111001),
.kernel_04(32'b00111101101111100100001100100101),
.kernel_05(32'b10111111000110011101111101001010),
.kernel_06(32'b00111100101011001100001000110110),
.kernel_07(32'b00111110010010111011111111111111),
.kernel_08(32'b00111101010011111010000110101110),
.pxl_out(pxl_out_532), .valid_out(valid_out_532) );

//Channel 533
conv_33 #(D, DATA_WIDTH) x533(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111100100101101011000000110001),
.kernel_01(32'b10111110000101001100010001100010),
.kernel_02(32'b00111110101101111001101000101110),
.kernel_03(32'b10111110001100100110111101111001),
.kernel_04(32'b10111110101101011001110111111100),
.kernel_05(32'b10111101101001001101000010111001),
.kernel_06(32'b00111110100011110111100011101101),
.kernel_07(32'b10111100100111001001101010111100),
.kernel_08(32'b10111110100100010110101000101010),
.pxl_out(pxl_out_533), .valid_out(valid_out_533) );

//Channel 534
conv_33 #(D, DATA_WIDTH) x534(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b00111100000101010010001111011110),
.kernel_01(32'b10111101101001100001001110101110),
.kernel_02(32'b00111101001000110100110001111100),
.kernel_03(32'b00111101010111000110010110011001),
.kernel_04(32'b00111101100101111110000010011010),
.kernel_05(32'b00111100101001100011110000111100),
.kernel_06(32'b10111101000000110011000101111010),
.kernel_07(32'b10111101010000001101100100100011),
.kernel_08(32'b10111100011000010101000000000001),
.pxl_out(pxl_out_534), .valid_out(valid_out_534) );

//Channel 535
conv_33 #(D, DATA_WIDTH) x535(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b00111101000110101000011011111000),
.kernel_01(32'b00111110101000100010011011111100),
.kernel_02(32'b10111100101000100000111001001110),
.kernel_03(32'b10111101001000110001000110010110),
.kernel_04(32'b10111100010011001110111110000000),
.kernel_05(32'b00111101011001110010110101110100),
.kernel_06(32'b00111101010111110111101010011011),
.kernel_07(32'b00111101011000100000000111110101),
.kernel_08(32'b10111101011011101010100001111001),
.pxl_out(pxl_out_535), .valid_out(valid_out_535) );

//Channel 536
conv_33 #(D, DATA_WIDTH) x536(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111101111010001100111000111110),
.kernel_01(32'b00111100101011001110001100111001),
.kernel_02(32'b00111100110010000110000001101000),
.kernel_03(32'b10111101010100111101010101101001),
.kernel_04(32'b10111110010000011110100111000111),
.kernel_05(32'b10111101110111101011111000110011),
.kernel_06(32'b00111101011111001000010100001111),
.kernel_07(32'b10111011011010111000010000100001),
.kernel_08(32'b10111101001110101000010001111100),
.pxl_out(pxl_out_536), .valid_out(valid_out_536) );

//Channel 537
conv_33 #(D, DATA_WIDTH) x537(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111101110010010010101001111110),
.kernel_01(32'b10111101010110111110010010100100),
.kernel_02(32'b10111101111000111011010100110010),
.kernel_03(32'b10111101010101001101110100110010),
.kernel_04(32'b10111011110001101000011110010110),
.kernel_05(32'b10111101011101111111000011100101),
.kernel_06(32'b00111101011100011010111010000011),
.kernel_07(32'b10111101000010001010111010101100),
.kernel_08(32'b00111100100011010000010100111010),
.pxl_out(pxl_out_537), .valid_out(valid_out_537) );

//Channel 538
conv_33 #(D, DATA_WIDTH) x538(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b00111110000100111001111011010000),
.kernel_01(32'b10111110110100000101110101101110),
.kernel_02(32'b00111110000001011111001101000010),
.kernel_03(32'b00111101000011000001100110111101),
.kernel_04(32'b00111110000010111000000001000111),
.kernel_05(32'b00111110110111101101101111011001),
.kernel_06(32'b10111110100111100000111100000111),
.kernel_07(32'b10111101110011010101000011110110),
.kernel_08(32'b10111110100010111010100110101010),
.pxl_out(pxl_out_538), .valid_out(valid_out_538) );

//Channel 539
conv_33 #(D, DATA_WIDTH) x539(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b10111110011101000011110001011001),
.kernel_01(32'b00111101011110100110001000011111),
.kernel_02(32'b10111101010101011111011000110010),
.kernel_03(32'b10111100111011110101100010111100),
.kernel_04(32'b10111110000111100110101011101010),
.kernel_05(32'b00111101100100010100100111011011),
.kernel_06(32'b00111110100110010000001111010111),
.kernel_07(32'b10111101010101111101000001110100),
.kernel_08(32'b00111101100001111110101011000100),
.pxl_out(pxl_out_539), .valid_out(valid_out_539) );

//Channel 540
conv_33 #(D, DATA_WIDTH) x540(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111100101001111100101101010000),
.kernel_01(32'b10111100100001011110100100010100),
.kernel_02(32'b10111101010100100110110001010101),
.kernel_03(32'b00111111000001100011001100001010),
.kernel_04(32'b00111110011100000110101011000001),
.kernel_05(32'b00111101001011011010010010001001),
.kernel_06(32'b00111110000101001110001101010010),
.kernel_07(32'b00111110000110111011111100101110),
.kernel_08(32'b00111111001000011110011001001000),
.pxl_out(pxl_out_540), .valid_out(valid_out_540) );

//Channel 541
conv_33 #(D, DATA_WIDTH) x541(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b10111110110010001000111111001001),
.kernel_01(32'b10111101101001010111011110000101),
.kernel_02(32'b10111101110001001011010101000111),
.kernel_03(32'b10111101010100010010110101101100),
.kernel_04(32'b10111101100101110100000001110111),
.kernel_05(32'b00111101110111111010001110001110),
.kernel_06(32'b10111110010000111000001011110110),
.kernel_07(32'b00111110111010011000010110111111),
.kernel_08(32'b10111101110010000010111110100110),
.pxl_out(pxl_out_541), .valid_out(valid_out_541) );

//Channel 542
conv_33 #(D, DATA_WIDTH) x542(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111101000010001101110111010100),
.kernel_01(32'b10111110110010010101011100000010),
.kernel_02(32'b10111101111010011110001010110001),
.kernel_03(32'b10111101011100101111001101101100),
.kernel_04(32'b10111101100010001111001111100111),
.kernel_05(32'b00111110100101001010111010000111),
.kernel_06(32'b10111110001011110101001010011001),
.kernel_07(32'b10111101101001000000010100100111),
.kernel_08(32'b10111101010101101101001000001110),
.pxl_out(pxl_out_542), .valid_out(valid_out_542) );

//Channel 543
conv_33 #(D, DATA_WIDTH) x543(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111100111011000011111011110101),
.kernel_01(32'b10111101000100100111100100010000),
.kernel_02(32'b00111110011010100101111011001000),
.kernel_03(32'b00111101010100010110110001110101),
.kernel_04(32'b00111110100001110000010100000010),
.kernel_05(32'b00111100100111000001100001110110),
.kernel_06(32'b00111101000110101111001100101000),
.kernel_07(32'b10111011000100100101001010101101),
.kernel_08(32'b10111110101100110011010001111000),
.pxl_out(pxl_out_543), .valid_out(valid_out_543) );

//Channel 544
conv_33 #(D, DATA_WIDTH) x544(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111110100110001011011111001110),
.kernel_01(32'b00111100011100110111111001011111),
.kernel_02(32'b10111101000110011001000111101010),
.kernel_03(32'b10111101101010111011111100110000),
.kernel_04(32'b10111110000010101001011001110010),
.kernel_05(32'b10111110100100011011011101110001),
.kernel_06(32'b10111110010011101100101011100000),
.kernel_07(32'b10111101111011111111011010001111),
.kernel_08(32'b10111100100001101000010011011001),
.pxl_out(pxl_out_544), .valid_out(valid_out_544) );

//Channel 545
conv_33 #(D, DATA_WIDTH) x545(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111101011000000101011001110101),
.kernel_01(32'b10111101011110110110100110000111),
.kernel_02(32'b00111101001100100101011000000101),
.kernel_03(32'b10111101011011111000111100101001),
.kernel_04(32'b00111101011010001101110011000011),
.kernel_05(32'b10111100010101110001111110100111),
.kernel_06(32'b00111101100111111101111011101100),
.kernel_07(32'b10111111001010000100011100010100),
.kernel_08(32'b10111100101011100111100011100111),
.pxl_out(pxl_out_545), .valid_out(valid_out_545) );

//Channel 546
conv_33 #(D, DATA_WIDTH) x546(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b00111100110101000011111101001011),
.kernel_01(32'b10111110010000101101011000010010),
.kernel_02(32'b10111101111001011000101001001001),
.kernel_03(32'b10111110001010110011000010000011),
.kernel_04(32'b00111101001101011000001111110011),
.kernel_05(32'b00111101001011011001000001101101),
.kernel_06(32'b10111111011111010011100110111001),
.kernel_07(32'b10111110001011001111000101110010),
.kernel_08(32'b00111101011000110101101011011110),
.pxl_out(pxl_out_546), .valid_out(valid_out_546) );

//Channel 547
conv_33 #(D, DATA_WIDTH) x547(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b10111100111111100001100011001001),
.kernel_01(32'b00111110100100111011011010011010),
.kernel_02(32'b00111011110011100110000010110010),
.kernel_03(32'b10111101100100110010110100001011),
.kernel_04(32'b00111101001000100101011001001011),
.kernel_05(32'b10111010101110101100001110101101),
.kernel_06(32'b00111101110110001010010110011011),
.kernel_07(32'b10111110101010000010010111111010),
.kernel_08(32'b00111101111001010100111100001000),
.pxl_out(pxl_out_547), .valid_out(valid_out_547) );

//Channel 548
conv_33 #(D, DATA_WIDTH) x548(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b10111101000100110110000100010101),
.kernel_01(32'b10111101011100110010111011000011),
.kernel_02(32'b10111110000111010001110010100011),
.kernel_03(32'b10111100000010001000010011101011),
.kernel_04(32'b10111110100001101010101111111000),
.kernel_05(32'b10111111000011111011011110000001),
.kernel_06(32'b10111110011000001011010101000000),
.kernel_07(32'b00111101111010111111011111110111),
.kernel_08(32'b00111101001000010001110100000101),
.pxl_out(pxl_out_548), .valid_out(valid_out_548) );

//Channel 549
conv_33 #(D, DATA_WIDTH) x549(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b10111100110001011000101110010010),
.kernel_01(32'b00111101010011010100101010110110),
.kernel_02(32'b00111110001000111001011011010101),
.kernel_03(32'b00111100100110111011011001010101),
.kernel_04(32'b10111101111101100111110010010010),
.kernel_05(32'b00111110000001110010100101101100),
.kernel_06(32'b10111110011010110000001011011001),
.kernel_07(32'b00111000100111101111111010111110),
.kernel_08(32'b10111101111101100010110000011010),
.pxl_out(pxl_out_549), .valid_out(valid_out_549) );

//Channel 550
conv_33 #(D, DATA_WIDTH) x550(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111110101001000111011010100111),
.kernel_01(32'b00111101110011101111100001110100),
.kernel_02(32'b00111101111010110110010111010101),
.kernel_03(32'b10111110101011110001011000111001),
.kernel_04(32'b00111101110100111100011110100110),
.kernel_05(32'b10111101001011000101111111111100),
.kernel_06(32'b00111110001100010010010001110000),
.kernel_07(32'b00111101111111110110010001010010),
.kernel_08(32'b10111110101011000100000110101111),
.pxl_out(pxl_out_550), .valid_out(valid_out_550) );

//Channel 551
conv_33 #(D, DATA_WIDTH) x551(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111101010101011011000010010000),
.kernel_01(32'b10111101011000111011010000010110),
.kernel_02(32'b10111110001001010001100101101111),
.kernel_03(32'b10111101011001100010001000111000),
.kernel_04(32'b00111101001111111010111010010010),
.kernel_05(32'b00111011111001000101010111010010),
.kernel_06(32'b00111101010111010000011110010011),
.kernel_07(32'b10111101011010110011010111010101),
.kernel_08(32'b10111101010110000001110100110110),
.pxl_out(pxl_out_551), .valid_out(valid_out_551) );

//Channel 552
conv_33 #(D, DATA_WIDTH) x552(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b10111101101001001101110000001110),
.kernel_01(32'b00111110000110001010110000111000),
.kernel_02(32'b00111100111000011101101101110101),
.kernel_03(32'b10111100111001111100100000011010),
.kernel_04(32'b00111101011101010010101110011111),
.kernel_05(32'b00111100000001111010000111111001),
.kernel_06(32'b10111110000001110101111110110001),
.kernel_07(32'b10111100001010010101100011110100),
.kernel_08(32'b10111110111001110101100100010011),
.pxl_out(pxl_out_552), .valid_out(valid_out_552) );

//Channel 553
conv_33 #(D, DATA_WIDTH) x553(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b00111110000111111011110111011100),
.kernel_01(32'b00111101001010000010101111000010),
.kernel_02(32'b00111110101011101111010010000101),
.kernel_03(32'b00111101000001010011010001000010),
.kernel_04(32'b10111100111111100011101011010011),
.kernel_05(32'b00111101100110001000100101101001),
.kernel_06(32'b10111110000011010101111000001000),
.kernel_07(32'b10111110110000110110100001000100),
.kernel_08(32'b00111110111101100110011100101101),
.pxl_out(pxl_out_553), .valid_out(valid_out_553) );

//Channel 554
conv_33 #(D, DATA_WIDTH) x554(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111101001101111011111010111000),
.kernel_01(32'b10111101000000111000000100100100),
.kernel_02(32'b10111101111001011001111100101101),
.kernel_03(32'b10111110000011011011010010011100),
.kernel_04(32'b00111110101000111011001110110110),
.kernel_05(32'b00111100110111110011100001101011),
.kernel_06(32'b10111101111111110000000010010110),
.kernel_07(32'b00111110001000110110110111101010),
.kernel_08(32'b10111110011100000111001001001000),
.pxl_out(pxl_out_554), .valid_out(valid_out_554) );

//Channel 555
conv_33 #(D, DATA_WIDTH) x555(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111110000000100001101010001011),
.kernel_01(32'b10111101001111011000000101010011),
.kernel_02(32'b10111101000000110100110000101100),
.kernel_03(32'b10111110010100111010111011011101),
.kernel_04(32'b00111101100011100101111001000110),
.kernel_05(32'b10111110110000101100010110100110),
.kernel_06(32'b00111101111010001011011101100101),
.kernel_07(32'b10111110001110110010111100001111),
.kernel_08(32'b10111101101001100100101111010011),
.pxl_out(pxl_out_555), .valid_out(valid_out_555) );

//Channel 556
conv_33 #(D, DATA_WIDTH) x556(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b10111110100101100001001011011101),
.kernel_01(32'b10111101000011111111001101001111),
.kernel_02(32'b00111110000101111010100110010110),
.kernel_03(32'b10111101110110100101000010110011),
.kernel_04(32'b10111101111101110011001000101111),
.kernel_05(32'b10111101011001010101010101100101),
.kernel_06(32'b00111110010010110010110001010011),
.kernel_07(32'b10111110110110100001001011110100),
.kernel_08(32'b10111101111011101001101101000011),
.pxl_out(pxl_out_556), .valid_out(valid_out_556) );

//Channel 557
conv_33 #(D, DATA_WIDTH) x557(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b10111101101000001010000001101010),
.kernel_01(32'b10111101110010111110001101001001),
.kernel_02(32'b00111110100010000100000000001110),
.kernel_03(32'b00111110000101001001001001010111),
.kernel_04(32'b10111110100111110101111110001111),
.kernel_05(32'b10111101100011010011100011001000),
.kernel_06(32'b00111110101101001000010001011000),
.kernel_07(32'b10111101001111100101110000100110),
.kernel_08(32'b10111100001101111001100100010001),
.pxl_out(pxl_out_557), .valid_out(valid_out_557) );

//Channel 558
conv_33 #(D, DATA_WIDTH) x558(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b10111111000111111010101100111001),
.kernel_01(32'b00111110110111111110010000100101),
.kernel_02(32'b00111110100010111010000011011111),
.kernel_03(32'b10111110010100110111101110011010),
.kernel_04(32'b10111100111100111000100100011010),
.kernel_05(32'b00111110011010000110111010011000),
.kernel_06(32'b10111111001000001001100101111011),
.kernel_07(32'b10111101111101110001000111111100),
.kernel_08(32'b10111100010101000111010001010011),
.pxl_out(pxl_out_558), .valid_out(valid_out_558) );

//Channel 559
conv_33 #(D, DATA_WIDTH) x559(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111100111110011111101001110000),
.kernel_01(32'b00111100010000011011001101001001),
.kernel_02(32'b00111110101010011101011010111100),
.kernel_03(32'b10111101011001101001010100011101),
.kernel_04(32'b10111100101111010110111000010011),
.kernel_05(32'b10111110011011111000010100111001),
.kernel_06(32'b10111101010101011111101110111010),
.kernel_07(32'b00111110000000000011100010100111),
.kernel_08(32'b10111101111110100111101110110111),
.pxl_out(pxl_out_559), .valid_out(valid_out_559) );

//Channel 560
conv_33 #(D, DATA_WIDTH) x560(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111101111001011010000101100101),
.kernel_01(32'b10111110100101100000101001101111),
.kernel_02(32'b00111101100100011110101010110001),
.kernel_03(32'b10111110110101000111101000101111),
.kernel_04(32'b10111101100110010001010111111010),
.kernel_05(32'b00111101010100001011111111101111),
.kernel_06(32'b10111111000110001110000011011000),
.kernel_07(32'b00111110100001100011000101010010),
.kernel_08(32'b00111100110000001001101101010101),
.pxl_out(pxl_out_560), .valid_out(valid_out_560) );

//Channel 561
conv_33 #(D, DATA_WIDTH) x561(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b00111101100010010011001001010110),
.kernel_01(32'b10111100100101111100101110011101),
.kernel_02(32'b00111110000000100110100000011110),
.kernel_03(32'b00111100100011110100010011000001),
.kernel_04(32'b00111110100110100010110001000111),
.kernel_05(32'b10111110010101111111001011111001),
.kernel_06(32'b00111110101010001110010101110111),
.kernel_07(32'b00111101101000011101001100011100),
.kernel_08(32'b10111110001101111110100111100010),
.pxl_out(pxl_out_561), .valid_out(valid_out_561) );

//Channel 562
conv_33 #(D, DATA_WIDTH) x562(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b00111101100101001011001101001011),
.kernel_01(32'b00111110101001111001100000100100),
.kernel_02(32'b10111110000000100101001110101000),
.kernel_03(32'b00111101101111101001100010001001),
.kernel_04(32'b00111110001100001010001010010001),
.kernel_05(32'b10111011110110000111101000000101),
.kernel_06(32'b10111101100100101000010011100001),
.kernel_07(32'b00111101101110111101010100100110),
.kernel_08(32'b00111110110100101001110100001110),
.pxl_out(pxl_out_562), .valid_out(valid_out_562) );

//Channel 563
conv_33 #(D, DATA_WIDTH) x563(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111110000101010001110011011110),
.kernel_01(32'b10111110010001100111101101110001),
.kernel_02(32'b10111100010001100010011110011000),
.kernel_03(32'b00111101111001001000101010101010),
.kernel_04(32'b10111111000100011010101001001010),
.kernel_05(32'b10111110001101001011000100001110),
.kernel_06(32'b10111101101000000010010001100111),
.kernel_07(32'b10111101011000000011101001111011),
.kernel_08(32'b10111101010100110011110101011010),
.pxl_out(pxl_out_563), .valid_out(valid_out_563) );

//Channel 564
conv_33 #(D, DATA_WIDTH) x564(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111101100001001101001110100011),
.kernel_01(32'b10111101111101110011110011110101),
.kernel_02(32'b10111110010100001011110001011000),
.kernel_03(32'b00111110001110101011001111001010),
.kernel_04(32'b00111101111000000011000101011001),
.kernel_05(32'b00111110110101101110001111111001),
.kernel_06(32'b10111101101010101011100001000111),
.kernel_07(32'b00111101111011000100010111100010),
.kernel_08(32'b10111110010011000001010010011100),
.pxl_out(pxl_out_564), .valid_out(valid_out_564) );

//Channel 565
conv_33 #(D, DATA_WIDTH) x565(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111101101001101011001111001101),
.kernel_01(32'b00111110100011111110111000011100),
.kernel_02(32'b00111110110101000010000010100010),
.kernel_03(32'b10111100000001010011000011110001),
.kernel_04(32'b00111101110000010000110010111001),
.kernel_05(32'b00111101110000000100101111011010),
.kernel_06(32'b00111101111111010000001001110000),
.kernel_07(32'b00111111000111001010110010101111),
.kernel_08(32'b00111110000100101111100000111111),
.pxl_out(pxl_out_565), .valid_out(valid_out_565) );

//Channel 566
conv_33 #(D, DATA_WIDTH) x566(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111101110000100000110010110101),
.kernel_01(32'b10111110001101101111111000010101),
.kernel_02(32'b10111101111001011000101100001010),
.kernel_03(32'b00111110000000011111000110001011),
.kernel_04(32'b00111110011010011010011100010001),
.kernel_05(32'b10111110000001011111011110001110),
.kernel_06(32'b00111101100111100010001001110100),
.kernel_07(32'b10111100010010111010010011010100),
.kernel_08(32'b10111110010001111010100110000011),
.pxl_out(pxl_out_566), .valid_out(valid_out_566) );

//Channel 567
conv_33 #(D, DATA_WIDTH) x567(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111011001001000100010000101100),
.kernel_01(32'b00111110100111111010001010000000),
.kernel_02(32'b10111100111011001010001001000010),
.kernel_03(32'b10111101100001011110101010101001),
.kernel_04(32'b00111110100100000110100001010111),
.kernel_05(32'b00111101011001001110000111110001),
.kernel_06(32'b00111101101010010100111110100011),
.kernel_07(32'b00111101010011000001010011001101),
.kernel_08(32'b10111110011111011010010010011110),
.pxl_out(pxl_out_567), .valid_out(valid_out_567) );

//Channel 568
conv_33 #(D, DATA_WIDTH) x568(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111111000110100111110111110001),
.kernel_01(32'b00111111001100111111111011100100),
.kernel_02(32'b10111100000100111110100001100101),
.kernel_03(32'b10111110000110101100101000010111),
.kernel_04(32'b10111101101110001101101011101100),
.kernel_05(32'b10111101111010101001000010001110),
.kernel_06(32'b00111111000001100011110101110011),
.kernel_07(32'b10111101100011101001111001011000),
.kernel_08(32'b10111110000010100101000001101010),
.pxl_out(pxl_out_568), .valid_out(valid_out_568) );

//Channel 569
conv_33 #(D, DATA_WIDTH) x569(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111110100011100011011010010101),
.kernel_01(32'b00111101010100000100101000001111),
.kernel_02(32'b10111110101101100010100000000101),
.kernel_03(32'b00111100101111001100011001100010),
.kernel_04(32'b00111101101010111001111000111100),
.kernel_05(32'b10111101001100101010011010000000),
.kernel_06(32'b00111101111000100011001010001010),
.kernel_07(32'b10111101101000000100101010100111),
.kernel_08(32'b00111110010101001101100111111100),
.pxl_out(pxl_out_569), .valid_out(valid_out_569) );

//Channel 570
conv_33 #(D, DATA_WIDTH) x570(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b00111101000001001000001100011011),
.kernel_01(32'b10111101100000011110011101101100),
.kernel_02(32'b00111101110100011110101011010101),
.kernel_03(32'b00111101010000101001101100000010),
.kernel_04(32'b10111101101010001010100110011111),
.kernel_05(32'b00111101111110111101010100100100),
.kernel_06(32'b00111101000000101000001010100101),
.kernel_07(32'b10111101010110110100011000000100),
.kernel_08(32'b10111101100111101001111110000111),
.pxl_out(pxl_out_570), .valid_out(valid_out_570) );

//Channel 571
conv_33 #(D, DATA_WIDTH) x571(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111101111110101101001110010000),
.kernel_01(32'b00111011111000101101000001010011),
.kernel_02(32'b10111100111101001011111111110110),
.kernel_03(32'b10111110000011101011011000001001),
.kernel_04(32'b10111110001011001000100010011011),
.kernel_05(32'b10111100111110101000000110010111),
.kernel_06(32'b00111101001111011000010111101011),
.kernel_07(32'b10111100010010011101000111010101),
.kernel_08(32'b00111100111110000001111110000110),
.pxl_out(pxl_out_571), .valid_out(valid_out_571) );

//Channel 572
conv_33 #(D, DATA_WIDTH) x572(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111100011101010100100110001101),
.kernel_01(32'b00111101101000111011100001101111),
.kernel_02(32'b00111101011011100010010110111101),
.kernel_03(32'b00111110000101110010110000000000),
.kernel_04(32'b00111100111100110100011011011100),
.kernel_05(32'b10111100100101001010001001101110),
.kernel_06(32'b00111101010111111001001110010001),
.kernel_07(32'b00111101101100100111101011000100),
.kernel_08(32'b00111101110110001010000100111011),
.pxl_out(pxl_out_572), .valid_out(valid_out_572) );

//Channel 573
conv_33 #(D, DATA_WIDTH) x573(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b10111110001110011000001011101010),
.kernel_01(32'b00111101011001011010110101001010),
.kernel_02(32'b00111011111101101100101110010000),
.kernel_03(32'b00111100001100001000010001011001),
.kernel_04(32'b00111110000101110100001011010100),
.kernel_05(32'b10111100110101000111110100000001),
.kernel_06(32'b00111100100010110111000001100000),
.kernel_07(32'b00111100001100000111110111110110),
.kernel_08(32'b10111100100110101100001101011110),
.pxl_out(pxl_out_573), .valid_out(valid_out_573) );

//Channel 574
conv_33 #(D, DATA_WIDTH) x574(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b00111011111011001001010111001001),
.kernel_01(32'b00111101100000101010010000011110),
.kernel_02(32'b00111101100010010010011000110101),
.kernel_03(32'b10111101001111111111011100001111),
.kernel_04(32'b10111100010010000011011100101101),
.kernel_05(32'b00111100101101111111100100110011),
.kernel_06(32'b10111100101101100100001101101010),
.kernel_07(32'b10111100000100011011111110001111),
.kernel_08(32'b10111110010000110110011100001110),
.pxl_out(pxl_out_574), .valid_out(valid_out_574) );

//Channel 575
conv_33 #(D, DATA_WIDTH) x575(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111100110100001000100010110000),
.kernel_01(32'b10111100101000111100000100101110),
.kernel_02(32'b00111101000110110001100001110110),
.kernel_03(32'b10111011100110110100100011010001),
.kernel_04(32'b00111100100001111101101011010100),
.kernel_05(32'b10111101011101111000001010001011),
.kernel_06(32'b00111101100000011010111111001001),
.kernel_07(32'b00111101101110000111111100001011),
.kernel_08(32'b00111100111010110111001000100110),
.pxl_out(pxl_out_575), .valid_out(valid_out_575) );

//Channel 576
conv_33 #(D, DATA_WIDTH) x576(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111101010001011100100100111110),
.kernel_01(32'b00111101010001011011011111100110),
.kernel_02(32'b00111100000111100110011001110000),
.kernel_03(32'b10111101100000010000101111010011),
.kernel_04(32'b10111100101000010010000100101010),
.kernel_05(32'b10111100010110110100111100011000),
.kernel_06(32'b10111011111100110100000111111110),
.kernel_07(32'b10111101000000011110011001100110),
.kernel_08(32'b10111100100000110011001010011010),
.pxl_out(pxl_out_576), .valid_out(valid_out_576) );

//Channel 577
conv_33 #(D, DATA_WIDTH) x577(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b10111110011011000000000000111011),
.kernel_01(32'b10111011101111011101111111010100),
.kernel_02(32'b00111101101010001111110010101101),
.kernel_03(32'b00111100101001000001010100111101),
.kernel_04(32'b00111100101000101110010101001100),
.kernel_05(32'b10111101101001111011001110100000),
.kernel_06(32'b00111100101000101100110110001111),
.kernel_07(32'b10111100100011110100000011100110),
.kernel_08(32'b00111101110001101011111001001110),
.pxl_out(pxl_out_577), .valid_out(valid_out_577) );

//Channel 578
conv_33 #(D, DATA_WIDTH) x578(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b00111100010011011011011000011100),
.kernel_01(32'b10111101100100011111101110101011),
.kernel_02(32'b10111101011011111010100001000101),
.kernel_03(32'b00111110111111000101001111100100),
.kernel_04(32'b00111110100000001000111011001001),
.kernel_05(32'b00111100100111000011100011101100),
.kernel_06(32'b10111100000011000011101111000111),
.kernel_07(32'b10111101101111111000000001001101),
.kernel_08(32'b00111011111001010001111010010000),
.pxl_out(pxl_out_578), .valid_out(valid_out_578) );

//Channel 579
conv_33 #(D, DATA_WIDTH) x579(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111101100101010100111000100010),
.kernel_01(32'b10111101001000000101100001100101),
.kernel_02(32'b10111101000101110011001011001110),
.kernel_03(32'b10111110001001000111011110010101),
.kernel_04(32'b00111100100100010110011001110101),
.kernel_05(32'b00111100101100101000011010000111),
.kernel_06(32'b00111101100011010111010111100100),
.kernel_07(32'b10111101011001111100011111000000),
.kernel_08(32'b00111101110100100110100000001001),
.pxl_out(pxl_out_579), .valid_out(valid_out_579) );

//Channel 580
conv_33 #(D, DATA_WIDTH) x580(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111101010000101111010011011010),
.kernel_01(32'b00111101000010000011100011011101),
.kernel_02(32'b10111011011100110100011001110000),
.kernel_03(32'b00111101010111100100100111001010),
.kernel_04(32'b00111101110001100110101110001000),
.kernel_05(32'b10111110101001100000011101111110),
.kernel_06(32'b10111100110010000100111110101000),
.kernel_07(32'b00111101001101010000101001001011),
.kernel_08(32'b00111101011000101111000101100011),
.pxl_out(pxl_out_580), .valid_out(valid_out_580) );

//Channel 581
conv_33 #(D, DATA_WIDTH) x581(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111100010111101101111110110101),
.kernel_01(32'b10111110000100100000100111000100),
.kernel_02(32'b10111101101110111000110000011100),
.kernel_03(32'b00111101110101011011011010010101),
.kernel_04(32'b00111101101101100101010101111111),
.kernel_05(32'b00111100110100001101011101001001),
.kernel_06(32'b00111101110101110001011011001110),
.kernel_07(32'b00111101000000000001001010111010),
.kernel_08(32'b00111110110010101100000000100000),
.pxl_out(pxl_out_581), .valid_out(valid_out_581) );

//Channel 582
conv_33 #(D, DATA_WIDTH) x582(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111110100011100111110011101001),
.kernel_01(32'b10111100100001010000101111001010),
.kernel_02(32'b10111100000000011100010011010000),
.kernel_03(32'b10111101100010010011111010000000),
.kernel_04(32'b00111110000001001011101001001010),
.kernel_05(32'b00111101111001011100110010111010),
.kernel_06(32'b00111110000101101000101001110010),
.kernel_07(32'b10111110001010011011010001010101),
.kernel_08(32'b00111101000011110010011101111001),
.pxl_out(pxl_out_582), .valid_out(valid_out_582) );

//Channel 583
conv_33 #(D, DATA_WIDTH) x583(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111011010000100110100111011101),
.kernel_01(32'b00111100101110100110100010000010),
.kernel_02(32'b00111101011101101111111010011101),
.kernel_03(32'b00111101100000001011011001101111),
.kernel_04(32'b10111100100000111010010000011010),
.kernel_05(32'b00111101001010110111010111000010),
.kernel_06(32'b00111101101111100101011000100100),
.kernel_07(32'b00111100110110101011100100111100),
.kernel_08(32'b00111101001001101000101001100010),
.pxl_out(pxl_out_583), .valid_out(valid_out_583) );

//Channel 584
conv_33 #(D, DATA_WIDTH) x584(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111101100100000111011100001011),
.kernel_01(32'b10111110101000011101001110010010),
.kernel_02(32'b10111101001001111110110010110011),
.kernel_03(32'b00111101100100011011000110001101),
.kernel_04(32'b10111110100010110100101100111001),
.kernel_05(32'b00111011101100001011000111011001),
.kernel_06(32'b00111101111011101000001110010000),
.kernel_07(32'b10111101001110000100000101110000),
.kernel_08(32'b00110101100001000111011111100101),
.pxl_out(pxl_out_584), .valid_out(valid_out_584) );

//Channel 585
conv_33 #(D, DATA_WIDTH) x585(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111110101011010000001100010000),
.kernel_01(32'b00111100000110111011110001100100),
.kernel_02(32'b10111110101100001110010001011010),
.kernel_03(32'b10111101100110010111110100001001),
.kernel_04(32'b00111100111100100101001011000010),
.kernel_05(32'b00111100110001001001111011101010),
.kernel_06(32'b00111110000000000110010111111010),
.kernel_07(32'b00111101100011000001011101010010),
.kernel_08(32'b00111101011000110110101010001111),
.pxl_out(pxl_out_585), .valid_out(valid_out_585) );

//Channel 586
conv_33 #(D, DATA_WIDTH) x586(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111101000011011011010111111010),
.kernel_01(32'b10111011111101110011111110011110),
.kernel_02(32'b00111100111100110011011011111111),
.kernel_03(32'b00111110000111110000011101100101),
.kernel_04(32'b10111110100110000110100101010001),
.kernel_05(32'b00111110111101100011010001111101),
.kernel_06(32'b00111101110011100110000110110100),
.kernel_07(32'b10111101111010001111110100000100),
.kernel_08(32'b00111101101000010001010000001011),
.pxl_out(pxl_out_586), .valid_out(valid_out_586) );

//Channel 587
conv_33 #(D, DATA_WIDTH) x587(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b00111100001100000110100011101110),
.kernel_01(32'b00111110011101100111110010100001),
.kernel_02(32'b10111101011101111100011100100000),
.kernel_03(32'b00111101100100111001101111010000),
.kernel_04(32'b00111100111101011011101010111001),
.kernel_05(32'b00111101111000010000001011010000),
.kernel_06(32'b00111110001000010010000110110100),
.kernel_07(32'b10111110100101101111101001001001),
.kernel_08(32'b00111101111011000011011001111001),
.pxl_out(pxl_out_587), .valid_out(valid_out_587) );

//Channel 588
conv_33 #(D, DATA_WIDTH) x588(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111101010110011110101111011111),
.kernel_01(32'b10111100111000101010000010110000),
.kernel_02(32'b10111101101101010000000110101110),
.kernel_03(32'b10111110000000100101001010100100),
.kernel_04(32'b10111101000011010110101100101000),
.kernel_05(32'b10111100111100000001000100001000),
.kernel_06(32'b10111110000000110101000111011100),
.kernel_07(32'b00111110001011001000110100010010),
.kernel_08(32'b00111100101101110110101000001011),
.pxl_out(pxl_out_588), .valid_out(valid_out_588) );

//Channel 589
conv_33 #(D, DATA_WIDTH) x589(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b10111110000001110101101011011100),
.kernel_01(32'b10111101111111010001001110001011),
.kernel_02(32'b10111101110100011101000010011001),
.kernel_03(32'b10111011110000000000101001010011),
.kernel_04(32'b00111110000100101100100111110000),
.kernel_05(32'b10111110000100100011110010001011),
.kernel_06(32'b00111101110010110010101101011110),
.kernel_07(32'b00111101111010000100100111100011),
.kernel_08(32'b10111101010011001101100010011001),
.pxl_out(pxl_out_589), .valid_out(valid_out_589) );

//Channel 590
conv_33 #(D, DATA_WIDTH) x590(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111110101110010101000110011101),
.kernel_01(32'b00111110100001100001100011101010),
.kernel_02(32'b10111110101010111001100000111101),
.kernel_03(32'b00111101011101100010111111101001),
.kernel_04(32'b00111101100100111101001000000001),
.kernel_05(32'b10111011110000110100100111100100),
.kernel_06(32'b10111110000011111010010010101111),
.kernel_07(32'b10111110100000101001100001100001),
.kernel_08(32'b10111110010010100101010111111100),
.pxl_out(pxl_out_590), .valid_out(valid_out_590) );

//Channel 591
conv_33 #(D, DATA_WIDTH) x591(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b10111101000100110111110001010010),
.kernel_01(32'b00111100101110000011101011100101),
.kernel_02(32'b10111101111000000101001001001110),
.kernel_03(32'b10111101110011010110000100010000),
.kernel_04(32'b00111101100001011101000000010101),
.kernel_05(32'b00111101011000101010100100001101),
.kernel_06(32'b10111101100101001100110000011110),
.kernel_07(32'b10111110000010101101110000011100),
.kernel_08(32'b00111101100101100100000000100110),
.pxl_out(pxl_out_591), .valid_out(valid_out_591) );

//Channel 592
conv_33 #(D, DATA_WIDTH) x592(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b00111101100110010010111100111001),
.kernel_01(32'b10111101011111110010100001101100),
.kernel_02(32'b00111100001101101001000011100110),
.kernel_03(32'b10111101011101010111011100110111),
.kernel_04(32'b10111101001110001001101011011100),
.kernel_05(32'b00111101111110101000101101111110),
.kernel_06(32'b00111101101101011100000011101100),
.kernel_07(32'b10111110011001000011011000001100),
.kernel_08(32'b00111110000100000111011111101001),
.pxl_out(pxl_out_592), .valid_out(valid_out_592) );

//Channel 593
conv_33 #(D, DATA_WIDTH) x593(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111101101010011111101000110101),
.kernel_01(32'b10111110001110011101110001100000),
.kernel_02(32'b10111100101100010010010001000101),
.kernel_03(32'b10111110000111111001001000110011),
.kernel_04(32'b10111101111001001110000000001011),
.kernel_05(32'b10111100100101110110111111101001),
.kernel_06(32'b00111101000110011101110101000100),
.kernel_07(32'b10111101000101001101010000010100),
.kernel_08(32'b00111110000110000011000101000011),
.pxl_out(pxl_out_593), .valid_out(valid_out_593) );

//Channel 594
conv_33 #(D, DATA_WIDTH) x594(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111101110010100000000111101111),
.kernel_01(32'b10111101110100101000111010110101),
.kernel_02(32'b10111101010110000000011001100001),
.kernel_03(32'b10111000000110011011101110000111),
.kernel_04(32'b10111101100000010101001001001011),
.kernel_05(32'b10111100110010010011000100101111),
.kernel_06(32'b10111100001111111111111101101110),
.kernel_07(32'b10111101110101110010010100010010),
.kernel_08(32'b00111101111100110001000100011110),
.pxl_out(pxl_out_594), .valid_out(valid_out_594) );

//Channel 595
conv_33 #(D, DATA_WIDTH) x595(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111101110000000111000110111001),
.kernel_01(32'b10111101111010111000010000101000),
.kernel_02(32'b10111101010001101110000111100101),
.kernel_03(32'b00111011111011110100010101100001),
.kernel_04(32'b00111101010111111001011001100011),
.kernel_05(32'b00111100010101111000101010111011),
.kernel_06(32'b00111101001110000101000100101010),
.kernel_07(32'b10111100100101001000111100010010),
.kernel_08(32'b10111101010010110011001101111001),
.pxl_out(pxl_out_595), .valid_out(valid_out_595) );

//Channel 596
conv_33 #(D, DATA_WIDTH) x596(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111101101001110100101100101111),
.kernel_01(32'b00111110100011001111001101111110),
.kernel_02(32'b00111101011111101000111011111001),
.kernel_03(32'b00111110000000101001111010000010),
.kernel_04(32'b10111011010110110101001010000011),
.kernel_05(32'b00111011110000000000100001101110),
.kernel_06(32'b10111110000011110100101100011110),
.kernel_07(32'b00111011100010001001001011100110),
.kernel_08(32'b10111011110110010110001011111010),
.pxl_out(pxl_out_596), .valid_out(valid_out_596) );

//Channel 597
conv_33 #(D, DATA_WIDTH) x597(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b10111101100111000000110010001011),
.kernel_01(32'b10111100000001001101001010100001),
.kernel_02(32'b10111100111110001000011100001111),
.kernel_03(32'b10111101101011001100110111110010),
.kernel_04(32'b10111101101001011000101110101100),
.kernel_05(32'b10111101001110100001000001111010),
.kernel_06(32'b00111101000011110000011101001011),
.kernel_07(32'b10111101101001010000000110100001),
.kernel_08(32'b10111110100100001111001100110000),
.pxl_out(pxl_out_597), .valid_out(valid_out_597) );

//Channel 598
conv_33 #(D, DATA_WIDTH) x598(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111110001100100001100110010010),
.kernel_01(32'b10111101010111011100111111010101),
.kernel_02(32'b00111101010011110100000010101111),
.kernel_03(32'b00111110000111010100110100001110),
.kernel_04(32'b10111101100010110111100100110000),
.kernel_05(32'b10111011110010111111100000111000),
.kernel_06(32'b10111101101101010001100001111111),
.kernel_07(32'b00111101000101000100010011100101),
.kernel_08(32'b00111110001110111111111011100111),
.pxl_out(pxl_out_598), .valid_out(valid_out_598) );

//Channel 599
conv_33 #(D, DATA_WIDTH) x599(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111101000101001100100001110001),
.kernel_01(32'b00111101101111101001000011110001),
.kernel_02(32'b10111101100000110100000110110110),
.kernel_03(32'b10111100100001110111010101010000),
.kernel_04(32'b00111101010111001000111110111111),
.kernel_05(32'b10111100111110010001110010101011),
.kernel_06(32'b00111100111110010001101010000111),
.kernel_07(32'b10111110001001110011101100100111),
.kernel_08(32'b10111100011010000011100100000000),
.pxl_out(pxl_out_599), .valid_out(valid_out_599) );

//Channel 600
conv_33 #(D, DATA_WIDTH) x600(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111101111001101101111101101111),
.kernel_01(32'b00111100110110101010011011111100),
.kernel_02(32'b00111100101000011011111010010000),
.kernel_03(32'b00111100111101110000011010010011),
.kernel_04(32'b10111100110000110011001010010000),
.kernel_05(32'b00111101110111000011001111100010),
.kernel_06(32'b00111101110110100101000000101010),
.kernel_07(32'b00111101110111000110100001111111),
.kernel_08(32'b10111101100111000100100011000000),
.pxl_out(pxl_out_600), .valid_out(valid_out_600) );

//Channel 601
conv_33 #(D, DATA_WIDTH) x601(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111101000000101111010000101001),
.kernel_01(32'b00111101000110100010111011100010),
.kernel_02(32'b10111110011011000101000100011101),
.kernel_03(32'b10111101110101111011111011001110),
.kernel_04(32'b00111101111111100101110001000110),
.kernel_05(32'b00111100000000000110111101101001),
.kernel_06(32'b10111100000111010111011101001010),
.kernel_07(32'b10111010110001111100001010111001),
.kernel_08(32'b00111011011011111101110111101000),
.pxl_out(pxl_out_601), .valid_out(valid_out_601) );

//Channel 602
conv_33 #(D, DATA_WIDTH) x602(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111101010010001010111011010110),
.kernel_01(32'b10111110010111000110101010111000),
.kernel_02(32'b00111101111110110001001011010010),
.kernel_03(32'b00111100100001111011011000110111),
.kernel_04(32'b00111101011100100110101011010101),
.kernel_05(32'b00111101100101110010000111111101),
.kernel_06(32'b10111101000010110110111001010001),
.kernel_07(32'b00111110000100101001111110000100),
.kernel_08(32'b10111110111001011011110010010101),
.pxl_out(pxl_out_602), .valid_out(valid_out_602) );

//Channel 603
conv_33 #(D, DATA_WIDTH) x603(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111101100010111100010001100010),
.kernel_01(32'b00111101101010010011001100110111),
.kernel_02(32'b10111101011111111111100001000111),
.kernel_03(32'b00111101100111010010000010111110),
.kernel_04(32'b00111101011100110110110101101110),
.kernel_05(32'b10111100111100011100001100001000),
.kernel_06(32'b10111101010101011100111001011001),
.kernel_07(32'b10111110011001011000000101110100),
.kernel_08(32'b10111110000101001110101010000100),
.pxl_out(pxl_out_603), .valid_out(valid_out_603) );

//Channel 604
conv_33 #(D, DATA_WIDTH) x604(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111100100011001010000101111010),
.kernel_01(32'b10111101110111001100011011001010),
.kernel_02(32'b10111110101100101011110110010011),
.kernel_03(32'b00111101000111100110111000111011),
.kernel_04(32'b00111101101110110000011101010110),
.kernel_05(32'b10111110010011010010100000111000),
.kernel_06(32'b00111101101001000110010010101101),
.kernel_07(32'b00111110001111001100001011110101),
.kernel_08(32'b00111110001000010001010101111010),
.pxl_out(pxl_out_604), .valid_out(valid_out_604) );

//Channel 605
conv_33 #(D, DATA_WIDTH) x605(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b10111111010101000011100000111101),
.kernel_01(32'b00111101110010001111000000000101),
.kernel_02(32'b00111110001010000101101001010001),
.kernel_03(32'b00111100100110010101100110100000),
.kernel_04(32'b10111110000100010010101110000111),
.kernel_05(32'b00111100010010110001000100111000),
.kernel_06(32'b00111101110010101010001001011110),
.kernel_07(32'b10111101101000111110101010101001),
.kernel_08(32'b10111100011001001110011110000101),
.pxl_out(pxl_out_605), .valid_out(valid_out_605) );

//Channel 606
conv_33 #(D, DATA_WIDTH) x606(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111100000000101011000000100010),
.kernel_01(32'b10111101011101000000101010001000),
.kernel_02(32'b00111011000001010001101111000101),
.kernel_03(32'b00111100101101001001100101011001),
.kernel_04(32'b10111100101111001100101011000011),
.kernel_05(32'b10111110010010010000000101110000),
.kernel_06(32'b00111101011111111000100010101000),
.kernel_07(32'b00111110000011000111101101000000),
.kernel_08(32'b00111110000111001000111111001011),
.pxl_out(pxl_out_606), .valid_out(valid_out_606) );

//Channel 607
conv_33 #(D, DATA_WIDTH) x607(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b00111101001001101011011101110000),
.kernel_01(32'b10111011101001001111010010110100),
.kernel_02(32'b00111011100011100101110001111010),
.kernel_03(32'b10111001100100100001101101011110),
.kernel_04(32'b10111101001100111100110101011100),
.kernel_05(32'b10111100101111010111001111010010),
.kernel_06(32'b10111100111011010110101000100000),
.kernel_07(32'b10111101010101001000010011111010),
.kernel_08(32'b00111101111010111100011100100000),
.pxl_out(pxl_out_607), .valid_out(valid_out_607) );

//Channel 608
conv_33 #(D, DATA_WIDTH) x608(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b00111100110111011100100010010100),
.kernel_01(32'b00111101111010110000101101000000),
.kernel_02(32'b10111101001111111010101100011001),
.kernel_03(32'b00111101111000101110011101111011),
.kernel_04(32'b00111110001111001100101011010010),
.kernel_05(32'b00111100101101001001111000110111),
.kernel_06(32'b10111101100000011000111100111111),
.kernel_07(32'b10111011100100110010011000011000),
.kernel_08(32'b10111101100001000100101110010110),
.pxl_out(pxl_out_608), .valid_out(valid_out_608) );

//Channel 609
conv_33 #(D, DATA_WIDTH) x609(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111110000110010111111111110100),
.kernel_01(32'b10111100001101110010001000101100),
.kernel_02(32'b00111100010111010001101110110011),
.kernel_03(32'b10111101100010000000001000110110),
.kernel_04(32'b10111101000011110100100011011010),
.kernel_05(32'b10111111010100101111010011100101),
.kernel_06(32'b10111100001000000010111000110110),
.kernel_07(32'b10111110000011110010111110011110),
.kernel_08(32'b10111100011101001010100000110011),
.pxl_out(pxl_out_609), .valid_out(valid_out_609) );

//Channel 610
conv_33 #(D, DATA_WIDTH) x610(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111101100001101101101010111011),
.kernel_01(32'b00111101000010010100011001100111),
.kernel_02(32'b00111110001100000110011011110000),
.kernel_03(32'b10111110001110011000001000101111),
.kernel_04(32'b10111101100010011111100001111000),
.kernel_05(32'b00111111010101100000101111001100),
.kernel_06(32'b00111110101010000110110011111110),
.kernel_07(32'b10111101100111001111110101000001),
.kernel_08(32'b00111101000000000110100111100101),
.pxl_out(pxl_out_610), .valid_out(valid_out_610) );

//Channel 611
conv_33 #(D, DATA_WIDTH) x611(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111100111110000111110000000101),
.kernel_01(32'b10111100101100000001010001101101),
.kernel_02(32'b00111101110000110001011011101000),
.kernel_03(32'b00111100001100011010110100101011),
.kernel_04(32'b10111100110001000000010011000111),
.kernel_05(32'b00111101010000010111110001100000),
.kernel_06(32'b00111100001010100111000101001010),
.kernel_07(32'b10111110110111000011010101010111),
.kernel_08(32'b10111110011111001110011001101101),
.pxl_out(pxl_out_611), .valid_out(valid_out_611) );

//Channel 612
conv_33 #(D, DATA_WIDTH) x612(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111100111001100111111001001100),
.kernel_01(32'b00111110100011100001011000100100),
.kernel_02(32'b10111101001100100100111000100101),
.kernel_03(32'b10111100110111010001010111110111),
.kernel_04(32'b10111111000011001111110011000111),
.kernel_05(32'b10111110001100000100011101010011),
.kernel_06(32'b10111101100011001101101101101100),
.kernel_07(32'b10111100011110101010111100101110),
.kernel_08(32'b10111100011100010110011001010011),
.pxl_out(pxl_out_612), .valid_out(valid_out_612) );

//Channel 613
conv_33 #(D, DATA_WIDTH) x613(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111101100010101010111010100001),
.kernel_01(32'b00111101101100100011100101100000),
.kernel_02(32'b00111110000000100011001111011110),
.kernel_03(32'b00111100110010111111011100010000),
.kernel_04(32'b10111101001100111101111010111111),
.kernel_05(32'b10111101001100010101111100110001),
.kernel_06(32'b10111110111010011100011000001111),
.kernel_07(32'b10111101001001100101001001111000),
.kernel_08(32'b00111101000011010010010100011110),
.pxl_out(pxl_out_613), .valid_out(valid_out_613) );

//Channel 614
conv_33 #(D, DATA_WIDTH) x614(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b10111110001000000011000111001100),
.kernel_01(32'b10111110000000111101011101001000),
.kernel_02(32'b00111100010011001001111100011101),
.kernel_03(32'b10111011011101100001000110101110),
.kernel_04(32'b00111100101111011100011100101110),
.kernel_05(32'b10111101110010110001110110100111),
.kernel_06(32'b00111011110100101101010100000101),
.kernel_07(32'b10111101010011000100100100111010),
.kernel_08(32'b10111110101101100100100011010100),
.pxl_out(pxl_out_614), .valid_out(valid_out_614) );

//Channel 615
conv_33 #(D, DATA_WIDTH) x615(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b00111110000101000110011100101100),
.kernel_01(32'b10111101000011101011111010111011),
.kernel_02(32'b00111101101010111000010011111110),
.kernel_03(32'b00111011110001110010100100100111),
.kernel_04(32'b00111101110111101101110000001110),
.kernel_05(32'b00111110101000100010010011100010),
.kernel_06(32'b00111101011011000110011000101011),
.kernel_07(32'b00111101010111001000111100100110),
.kernel_08(32'b10111100111001101101000001101001),
.pxl_out(pxl_out_615), .valid_out(valid_out_615) );

//Channel 616
conv_33 #(D, DATA_WIDTH) x616(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111101001110000000011011010101),
.kernel_01(32'b00111100000110000110101010000001),
.kernel_02(32'b00111101001101011000000010001000),
.kernel_03(32'b10111100001101111000101110011111),
.kernel_04(32'b10111110011101001011011100100111),
.kernel_05(32'b00111100111111110100001010111001),
.kernel_06(32'b10111101101001010001000110100011),
.kernel_07(32'b10111101100101111111001001010101),
.kernel_08(32'b00111101111100111101010000010011),
.pxl_out(pxl_out_616), .valid_out(valid_out_616) );

//Channel 617
conv_33 #(D, DATA_WIDTH) x617(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111110000010010010011011101101),
.kernel_01(32'b00111110111011011100101101000111),
.kernel_02(32'b10111101001110101101000101101010),
.kernel_03(32'b10111110000111011001000101101001),
.kernel_04(32'b10111010001110111100011011110111),
.kernel_05(32'b00111101110100011111100000110010),
.kernel_06(32'b10111110000101011010100000010001),
.kernel_07(32'b10111101001000100100000010011000),
.kernel_08(32'b00111101001111000100100101011000),
.pxl_out(pxl_out_617), .valid_out(valid_out_617) );

//Channel 618
conv_33 #(D, DATA_WIDTH) x618(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111110011011001100100100001000),
.kernel_01(32'b10111110100011000100000011110110),
.kernel_02(32'b00111101110101010001000101111101),
.kernel_03(32'b00111101101110100101100011001101),
.kernel_04(32'b00111110100001000001011000101100),
.kernel_05(32'b10111110000000111011010101100011),
.kernel_06(32'b10111011010001011100010110010111),
.kernel_07(32'b00111110000111100011001100001000),
.kernel_08(32'b10111110001110000011111111000001),
.pxl_out(pxl_out_618), .valid_out(valid_out_618) );

//Channel 619
conv_33 #(D, DATA_WIDTH) x619(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111110100010011000100100110011),
.kernel_01(32'b00111101001110011011110101110110),
.kernel_02(32'b00111111010000011011101100010110),
.kernel_03(32'b10111101010011111110100110101010),
.kernel_04(32'b10111110011101101011011001110000),
.kernel_05(32'b00111100000110001010110011001010),
.kernel_06(32'b00111101011100110110110011110011),
.kernel_07(32'b10111100111001100010100001111011),
.kernel_08(32'b00111010101011110000010001001011),
.pxl_out(pxl_out_619), .valid_out(valid_out_619) );

//Channel 620
conv_33 #(D, DATA_WIDTH) x620(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b10111100101110001111100101011011),
.kernel_01(32'b00111100110110110111011011100100),
.kernel_02(32'b10111101110110011001111101010101),
.kernel_03(32'b10111101011110111100000011110111),
.kernel_04(32'b00111100000111010110010000101010),
.kernel_05(32'b10111100001101000111101110100011),
.kernel_06(32'b10111101000110111010010111010010),
.kernel_07(32'b00111101011100101011011011100100),
.kernel_08(32'b00111011101111010011011100111111),
.pxl_out(pxl_out_620), .valid_out(valid_out_620) );

//Channel 621
conv_33 #(D, DATA_WIDTH) x621(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b10111011001010000101101011101010),
.kernel_01(32'b10111101101100111111010010111001),
.kernel_02(32'b00111100010000101001100010110000),
.kernel_03(32'b10111101100011110101110101011000),
.kernel_04(32'b10111100111110101100010001001111),
.kernel_05(32'b00111101011000011100001101011100),
.kernel_06(32'b00111100011100100110100000111001),
.kernel_07(32'b00111101000001000000101101010101),
.kernel_08(32'b00111100111011110110001001000110),
.pxl_out(pxl_out_621), .valid_out(valid_out_621) );

//Channel 622
conv_33 #(D, DATA_WIDTH) x622(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111101001001010011101010000011),
.kernel_01(32'b00111100100101101101111101011101),
.kernel_02(32'b00111101011000110110111100110101),
.kernel_03(32'b00111101010011010100110011111101),
.kernel_04(32'b10111101000100000110000101010011),
.kernel_05(32'b10111101100010100111011001011011),
.kernel_06(32'b10111100110100010011101101000111),
.kernel_07(32'b00111101101001101100001101101010),
.kernel_08(32'b10111100000111101110101111111011),
.pxl_out(pxl_out_622), .valid_out(valid_out_622) );

//Channel 623
conv_33 #(D, DATA_WIDTH) x623(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b10111101001011000001100001000110),
.kernel_01(32'b00111101100101101001000010100101),
.kernel_02(32'b10111110110000100111011110010001),
.kernel_03(32'b00111101101000010001100000100001),
.kernel_04(32'b00111101110110011110110110101100),
.kernel_05(32'b00111100111010001100111010000000),
.kernel_06(32'b10111010001000110111001010111010),
.kernel_07(32'b10111110000010111101111111100010),
.kernel_08(32'b00111101101101011100010101011110),
.pxl_out(pxl_out_623), .valid_out(valid_out_623) );

//Channel 624
conv_33 #(D, DATA_WIDTH) x624(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111101010010101001001111100111),
.kernel_01(32'b00111101011100011010000011011110),
.kernel_02(32'b10111001100001001010001011110000),
.kernel_03(32'b10111101101101011010100101011000),
.kernel_04(32'b00111101010000100010100100011111),
.kernel_05(32'b10111010101101111100001111101111),
.kernel_06(32'b00111110101111010000000001110100),
.kernel_07(32'b00111101110111000100101010111100),
.kernel_08(32'b00111101111100000011001000000110),
.pxl_out(pxl_out_624), .valid_out(valid_out_624) );

//Channel 625
conv_33 #(D, DATA_WIDTH) x625(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111110010000110000001000011111),
.kernel_01(32'b00111100011000101101001111000111),
.kernel_02(32'b00111100100101010010101011110000),
.kernel_03(32'b10111011110001100110111110111110),
.kernel_04(32'b10111101100000101110000100000110),
.kernel_05(32'b10111110111011101100101111100010),
.kernel_06(32'b10111100110010111010111011100110),
.kernel_07(32'b00111101000000110011111100110001),
.kernel_08(32'b00111100101011111000001110000100),
.pxl_out(pxl_out_625), .valid_out(valid_out_625) );

//Channel 626
conv_33 #(D, DATA_WIDTH) x626(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111101110000010001000010000100),
.kernel_01(32'b00111101110110101101001010111001),
.kernel_02(32'b10111101011110100011100011110000),
.kernel_03(32'b00111100000001100101000011111110),
.kernel_04(32'b10111100110001101101100100001100),
.kernel_05(32'b00111101001011111110101011111100),
.kernel_06(32'b00111110000100101011000111001100),
.kernel_07(32'b00111101101100101100111000101101),
.kernel_08(32'b10111100010000010001011111110010),
.pxl_out(pxl_out_626), .valid_out(valid_out_626) );

//Channel 627
conv_33 #(D, DATA_WIDTH) x627(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111100010000110100010101001001),
.kernel_01(32'b10111101010011000000011001011010),
.kernel_02(32'b00111100000001001001010110100010),
.kernel_03(32'b10111110111111100001110111110111),
.kernel_04(32'b00111100001011011100111110000001),
.kernel_05(32'b00111011011001111111111000100100),
.kernel_06(32'b00111100110110000110111001001001),
.kernel_07(32'b10111101001100011010011011100110),
.kernel_08(32'b00111011000000001110100001111001),
.pxl_out(pxl_out_627), .valid_out(valid_out_627) );

//Channel 628
conv_33 #(D, DATA_WIDTH) x628(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111101100111101011111001110101),
.kernel_01(32'b10111110001001000010110110110101),
.kernel_02(32'b10111100110001011110011100110111),
.kernel_03(32'b00111111001001001010001010111110),
.kernel_04(32'b00111111001011110100001000110100),
.kernel_05(32'b10111100101010100111010100011001),
.kernel_06(32'b10111101001011011011111000100110),
.kernel_07(32'b00111101000111010001110100101001),
.kernel_08(32'b10111011100010110011110111101110),
.pxl_out(pxl_out_628), .valid_out(valid_out_628) );

//Channel 629
conv_33 #(D, DATA_WIDTH) x629(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111100000111110000011001100111),
.kernel_01(32'b00111110001100001010100110111000),
.kernel_02(32'b00111100001011000100000001101000),
.kernel_03(32'b00111101101001011001101000000110),
.kernel_04(32'b10111100110100110000101111001011),
.kernel_05(32'b10111110110101111011111100101110),
.kernel_06(32'b10111110111000000010100100010000),
.kernel_07(32'b00111100000110110111111001111000),
.kernel_08(32'b00111110001001011110100000101110),
.pxl_out(pxl_out_629), .valid_out(valid_out_629) );

//Channel 630
conv_33 #(D, DATA_WIDTH) x630(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111101001101110010100000110100),
.kernel_01(32'b00111100001010101011000100101100),
.kernel_02(32'b00111110000011000110010011001111),
.kernel_03(32'b00111110100011110111000011010010),
.kernel_04(32'b00111101100111100100100011110011),
.kernel_05(32'b10111100100010101111001000100010),
.kernel_06(32'b10111110001000100110101111011101),
.kernel_07(32'b10111010111110011101001101100001),
.kernel_08(32'b00111110100011001001110111100110),
.pxl_out(pxl_out_630), .valid_out(valid_out_630) );

//Channel 631
conv_33 #(D, DATA_WIDTH) x631(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111110100001100100001000100011),
.kernel_01(32'b10111011111111011111100110011100),
.kernel_02(32'b10111110100000111111100011011001),
.kernel_03(32'b10111100101001001010111111010111),
.kernel_04(32'b10111110010100100000001001010010),
.kernel_05(32'b10111101001000100001110100010101),
.kernel_06(32'b10111110001110111001001000101010),
.kernel_07(32'b10111110101111001101000010000110),
.kernel_08(32'b00111100110011111011111010000110),
.pxl_out(pxl_out_631), .valid_out(valid_out_631) );

//Channel 632
conv_33 #(D, DATA_WIDTH) x632(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111110010110010110100111110110),
.kernel_01(32'b00111101001000101100111001011110),
.kernel_02(32'b10111101111000010011001110100000),
.kernel_03(32'b10111101000100111110110100100010),
.kernel_04(32'b10111101010100011001000001001000),
.kernel_05(32'b00111100001010111110110001010111),
.kernel_06(32'b10111110000011110100001101110001),
.kernel_07(32'b10111000101110101010110010000000),
.kernel_08(32'b00111101100011010011110010010111),
.pxl_out(pxl_out_632), .valid_out(valid_out_632) );

//Channel 633
conv_33 #(D, DATA_WIDTH) x633(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111101001001111110111000011000),
.kernel_01(32'b10111101101100100101011101111111),
.kernel_02(32'b00111110000000101101100011101100),
.kernel_03(32'b00111110100100000101101011000010),
.kernel_04(32'b10111110000100100000111001111111),
.kernel_05(32'b10111110001010101101011010110101),
.kernel_06(32'b10111110001000100110011111110000),
.kernel_07(32'b10111100101010110101100011001000),
.kernel_08(32'b10111110110011111011010110011111),
.pxl_out(pxl_out_633), .valid_out(valid_out_633) );

//Channel 634
conv_33 #(D, DATA_WIDTH) x634(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b00111101011100111101100001111000),
.kernel_01(32'b00111110001000110000010100110011),
.kernel_02(32'b00111100111010111001010100111110),
.kernel_03(32'b00111101010110000001011100001101),
.kernel_04(32'b10111111001111111100110001110000),
.kernel_05(32'b00111101000111101011111111101110),
.kernel_06(32'b10111101000111101101011110011001),
.kernel_07(32'b00111101101010000000110001001011),
.kernel_08(32'b10111101110001101100101111101101),
.pxl_out(pxl_out_634), .valid_out(valid_out_634) );

//Channel 635
conv_33 #(D, DATA_WIDTH) x635(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b10111101011110000000100111001111),
.kernel_01(32'b00111101111011001011000000011100),
.kernel_02(32'b10111110100001111011000100011000),
.kernel_03(32'b00111110110111100001110011011101),
.kernel_04(32'b00111110111001001010100010100000),
.kernel_05(32'b10111110110011101110100110100100),
.kernel_06(32'b10111110000100000001011100101001),
.kernel_07(32'b00111100110101101110000100100110),
.kernel_08(32'b00111100100101111100100110111011),
.pxl_out(pxl_out_635), .valid_out(valid_out_635) );

//Channel 636
conv_33 #(D, DATA_WIDTH) x636(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111101101110110110111010101010),
.kernel_01(32'b10111101010000110011111011101110),
.kernel_02(32'b10111110111101101001101100001001),
.kernel_03(32'b10111101100100110001101001010101),
.kernel_04(32'b10111101010000110101001101110000),
.kernel_05(32'b00111101001100010101011010111011),
.kernel_06(32'b10111110001000110001010000001101),
.kernel_07(32'b00111110100100010110010000010101),
.kernel_08(32'b10111110000001000000011111100101),
.pxl_out(pxl_out_636), .valid_out(valid_out_636) );

//Channel 637
conv_33 #(D, DATA_WIDTH) x637(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111110001110000111001000011110),
.kernel_01(32'b10111101110001111110111110000000),
.kernel_02(32'b00111101010101101011010100101100),
.kernel_03(32'b00111110010010110110000010000010),
.kernel_04(32'b00111110011101111011100010011111),
.kernel_05(32'b10111101011101110101110100000110),
.kernel_06(32'b00111101100000100110110001110000),
.kernel_07(32'b10111101011011000111101000000100),
.kernel_08(32'b00111100101011101011111010001011),
.pxl_out(pxl_out_637), .valid_out(valid_out_637) );

//Channel 638
conv_33 #(D, DATA_WIDTH) x638(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111110010000000100000011111101),
.kernel_01(32'b10111101001010101001001111011110),
.kernel_02(32'b00111101001010001100010111101000),
.kernel_03(32'b10111101110111111111001111111011),
.kernel_04(32'b10111101100001110101101100010011),
.kernel_05(32'b00111110000101101100010110101011),
.kernel_06(32'b00111101001001001100101011101100),
.kernel_07(32'b00111100100011011001111110110100),
.kernel_08(32'b10111110010100111011110000101000),
.pxl_out(pxl_out_638), .valid_out(valid_out_638) );

//Channel 639
conv_33 #(D, DATA_WIDTH) x639(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111101110000110000101000000101),
.kernel_01(32'b10111101101011110011100010001110),
.kernel_02(32'b00111101101111111000010100001111),
.kernel_03(32'b00111100101111011110101110011001),
.kernel_04(32'b00111100110001100011011011111110),
.kernel_05(32'b00111101100011010010001100110100),
.kernel_06(32'b00111100101000010110011100101110),
.kernel_07(32'b00111110100001011111110001011000),
.kernel_08(32'b00111110000111100001001011000110),
.pxl_out(pxl_out_639), .valid_out(valid_out_639) );

//Channel 640
conv_33 #(D, DATA_WIDTH) x640(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111101100010000100101001100110),
.kernel_01(32'b00111011101111010111001101100101),
.kernel_02(32'b10111011110111010000000101010110),
.kernel_03(32'b10111101100111110100001001101011),
.kernel_04(32'b00111100001001110101110100010110),
.kernel_05(32'b00111110000000011110010101100101),
.kernel_06(32'b00111100011000011100101111100100),
.kernel_07(32'b10111100111110110110111011011101),
.kernel_08(32'b00111101001001110111101011100101),
.pxl_out(pxl_out_640), .valid_out(valid_out_640) );

//Channel 641
conv_33 #(D, DATA_WIDTH) x641(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111110001110011111101110110101),
.kernel_01(32'b10111101001111100111110000110111),
.kernel_02(32'b10111101000101000011010111001010),
.kernel_03(32'b10111100010001010010101001001011),
.kernel_04(32'b00111110010010011100000100101000),
.kernel_05(32'b10111110100111011000001011111001),
.kernel_06(32'b00111100010001100010001001110010),
.kernel_07(32'b10111101110101110110110110010111),
.kernel_08(32'b10111100100110001100111001110010),
.pxl_out(pxl_out_641), .valid_out(valid_out_641) );

//Channel 642
conv_33 #(D, DATA_WIDTH) x642(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111101010101100101110000001000),
.kernel_01(32'b00111101010110000111011001101011),
.kernel_02(32'b00111101000001000011011111111011),
.kernel_03(32'b10111100001101100110000100011001),
.kernel_04(32'b10111110001000110100010100110011),
.kernel_05(32'b00111100100001011000001111100011),
.kernel_06(32'b10111100100111000110011100110110),
.kernel_07(32'b00111101010110101010011111010100),
.kernel_08(32'b00111100111001100010011010111100),
.pxl_out(pxl_out_642), .valid_out(valid_out_642) );

//Channel 643
conv_33 #(D, DATA_WIDTH) x643(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b10111100101100000111101100001001),
.kernel_01(32'b00111101101111100011000010011000),
.kernel_02(32'b00111100111111011110101100001000),
.kernel_03(32'b00111110001011101011010101110000),
.kernel_04(32'b00111101110100000010000001010100),
.kernel_05(32'b00111100010101010010000001100101),
.kernel_06(32'b10111010101111011001101010010110),
.kernel_07(32'b00111100111000010101101000110111),
.kernel_08(32'b00111101100111100111010101111010),
.pxl_out(pxl_out_643), .valid_out(valid_out_643) );

//Channel 644
conv_33 #(D, DATA_WIDTH) x644(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111101111110011010010101000010),
.kernel_01(32'b00111100111100001100111000011101),
.kernel_02(32'b00111100101101110100111011111011),
.kernel_03(32'b10111100110001101001100000100000),
.kernel_04(32'b10111101100000110110001100010100),
.kernel_05(32'b00111101010001000101011000111011),
.kernel_06(32'b00111101011000000111110010000111),
.kernel_07(32'b00111101101011000100111101010111),
.kernel_08(32'b10111110000011011101010000111111),
.pxl_out(pxl_out_644), .valid_out(valid_out_644) );

//Channel 645
conv_33 #(D, DATA_WIDTH) x645(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111100101000101011000101001100),
.kernel_01(32'b10111101100001010001100110010101),
.kernel_02(32'b10111110100110010000111110001100),
.kernel_03(32'b00111101100001001110010101001101),
.kernel_04(32'b10111110001000010110010100000001),
.kernel_05(32'b00111101111110111011100111011001),
.kernel_06(32'b00111101100000000101000101001000),
.kernel_07(32'b00111110101001001111100111100011),
.kernel_08(32'b10111110010010110011110011000110),
.pxl_out(pxl_out_645), .valid_out(valid_out_645) );

//Channel 646
conv_33 #(D, DATA_WIDTH) x646(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111101011110110101101010001001),
.kernel_01(32'b10111110001000100000011111011101),
.kernel_02(32'b10111011111110110110101001111111),
.kernel_03(32'b00111101101100111101010101010010),
.kernel_04(32'b10111110000001110100101001111110),
.kernel_05(32'b00111110000010101000000011000010),
.kernel_06(32'b10111101010000010001110000100011),
.kernel_07(32'b00111101101111111110101111111111),
.kernel_08(32'b00111110111001110010111011101111),
.pxl_out(pxl_out_646), .valid_out(valid_out_646) );

//Channel 647
conv_33 #(D, DATA_WIDTH) x647(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b00111110001011000100010011010011),
.kernel_01(32'b00111110100010111101011001010110),
.kernel_02(32'b10111110101010001010011101000000),
.kernel_03(32'b10111101100101001001100001010011),
.kernel_04(32'b10111101111101011101101101000001),
.kernel_05(32'b00111101100110100011101000011010),
.kernel_06(32'b00111110001100111010001101000101),
.kernel_07(32'b10111101000000011010101100000100),
.kernel_08(32'b10111010011100100111010000110111),
.pxl_out(pxl_out_647), .valid_out(valid_out_647) );

//Channel 648
conv_33 #(D, DATA_WIDTH) x648(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111101100000111000100010000001),
.kernel_01(32'b10111110010010001110101010000010),
.kernel_02(32'b00111100100101100101011110011001),
.kernel_03(32'b00111010010110101010101011110111),
.kernel_04(32'b10111100100101011111001011110000),
.kernel_05(32'b10111100100100100111101011000110),
.kernel_06(32'b00111110100110010100010001010000),
.kernel_07(32'b10111100010101110111111010000000),
.kernel_08(32'b00111110011110001100100100000010),
.pxl_out(pxl_out_648), .valid_out(valid_out_648) );

//Channel 649
conv_33 #(D, DATA_WIDTH) x649(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b00111100110110011011111111001111),
.kernel_01(32'b00111100000001101111101011010110),
.kernel_02(32'b10111101100001110000010001100111),
.kernel_03(32'b00111100111111011100001100000110),
.kernel_04(32'b00111101100010110101101011001000),
.kernel_05(32'b00111110011001010110001000111101),
.kernel_06(32'b00111100101000110011111110000001),
.kernel_07(32'b10111101000011111101100000011101),
.kernel_08(32'b10111101101110101101000110000010),
.pxl_out(pxl_out_649), .valid_out(valid_out_649) );

//Channel 650
conv_33 #(D, DATA_WIDTH) x650(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111100000111111111100001100010),
.kernel_01(32'b00111011110000000111001001000001),
.kernel_02(32'b10111110001111000010101000100101),
.kernel_03(32'b10111101001101010101111011101000),
.kernel_04(32'b10111101111011110110001101101100),
.kernel_05(32'b00111100001000011100111000001111),
.kernel_06(32'b00111011000011010100010010100010),
.kernel_07(32'b00111011100110100000101100000101),
.kernel_08(32'b10111011101011001111101100001001),
.pxl_out(pxl_out_650), .valid_out(valid_out_650) );

//Channel 651
conv_33 #(D, DATA_WIDTH) x651(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111110101011100011111000111110),
.kernel_01(32'b10111100001010101111111010010011),
.kernel_02(32'b10111100010101010111001001010111),
.kernel_03(32'b10111101000111011100100100001101),
.kernel_04(32'b00111101100111010101111111100001),
.kernel_05(32'b00111101001000111110100001111001),
.kernel_06(32'b00111101111011110100110001010010),
.kernel_07(32'b00111101100010010110010011001010),
.kernel_08(32'b10111101100101011011111110000111),
.pxl_out(pxl_out_651), .valid_out(valid_out_651) );

//Channel 652
conv_33 #(D, DATA_WIDTH) x652(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111101000110101100001100110011),
.kernel_01(32'b10111101001101001110001010111010),
.kernel_02(32'b10111101100000110010000011100011),
.kernel_03(32'b10111110001101000110000100010100),
.kernel_04(32'b10111101110000111110111000111001),
.kernel_05(32'b00111110011100011001001111001110),
.kernel_06(32'b00111100010111011100011111101011),
.kernel_07(32'b00111110110000010010011100110110),
.kernel_08(32'b10111101011101111101000001011000),
.pxl_out(pxl_out_652), .valid_out(valid_out_652) );

//Channel 653
conv_33 #(D, DATA_WIDTH) x653(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b10111100001100100101100101101010),
.kernel_01(32'b10111110011010011110111000001001),
.kernel_02(32'b00111110001101001110100001010011),
.kernel_03(32'b10111100101001001110011101101100),
.kernel_04(32'b00111101000010010110001111011000),
.kernel_05(32'b00111101011000110011000100111011),
.kernel_06(32'b00111110001001100101110111010101),
.kernel_07(32'b00111011101111010110111011100000),
.kernel_08(32'b10111101101011011111100100010110),
.pxl_out(pxl_out_653), .valid_out(valid_out_653) );

//Channel 654
conv_33 #(D, DATA_WIDTH) x654(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111101101011110001001100010000),
.kernel_01(32'b10111110110011100110000011100101),
.kernel_02(32'b00111101000000111010111111100110),
.kernel_03(32'b00111101110100011111001010110011),
.kernel_04(32'b10111101010000100110101100010111),
.kernel_05(32'b10111110001100111110010000010011),
.kernel_06(32'b10111111001011001010011010000001),
.kernel_07(32'b10111011111100001001011110110101),
.kernel_08(32'b10111101101001010011100110110011),
.pxl_out(pxl_out_654), .valid_out(valid_out_654) );

//Channel 655
conv_33 #(D, DATA_WIDTH) x655(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111101100101000111111000011010),
.kernel_01(32'b00111011101000101100100110110000),
.kernel_02(32'b10111110011000010101100100110101),
.kernel_03(32'b10111110110001001011101101011100),
.kernel_04(32'b10111101010010011000011100100001),
.kernel_05(32'b00111110101000100111110000100101),
.kernel_06(32'b10111010111011011101010011110111),
.kernel_07(32'b00111101110110100000100100101101),
.kernel_08(32'b10111110100101011001100110100011),
.pxl_out(pxl_out_655), .valid_out(valid_out_655) );

//Channel 656
conv_33 #(D, DATA_WIDTH) x656(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111101101010000001000001110101),
.kernel_01(32'b10111101101101100001001110101001),
.kernel_02(32'b00111110001111101111010110110011),
.kernel_03(32'b10111101100101011101001011000010),
.kernel_04(32'b00111110011101101101110001010101),
.kernel_05(32'b10111101110110110101001101110100),
.kernel_06(32'b00111101110110011110111100001111),
.kernel_07(32'b00111101100011100100101111011101),
.kernel_08(32'b00111101010011101100011000110000),
.pxl_out(pxl_out_656), .valid_out(valid_out_656) );

//Channel 657
conv_33 #(D, DATA_WIDTH) x657(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111110001101111000000010110101),
.kernel_01(32'b00111101101001101101000010111101),
.kernel_02(32'b00111110000010101001110010110111),
.kernel_03(32'b10111101100110001000001100100011),
.kernel_04(32'b00111101000100000011110011111100),
.kernel_05(32'b10111110001100110111101100010011),
.kernel_06(32'b10111110111000110111100111101101),
.kernel_07(32'b00111100101011010101111011000110),
.kernel_08(32'b10111110100011001011100101010110),
.pxl_out(pxl_out_657), .valid_out(valid_out_657) );

//Channel 658
conv_33 #(D, DATA_WIDTH) x658(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111110000011111010110101000010),
.kernel_01(32'b00111101010011000010011000010111),
.kernel_02(32'b10111101010000011101100110111110),
.kernel_03(32'b00111101111000110101100001000111),
.kernel_04(32'b10111100000101011101101111001110),
.kernel_05(32'b10111110010010110011110010000111),
.kernel_06(32'b00111101010010111010001010000011),
.kernel_07(32'b00111110101001100100100111110010),
.kernel_08(32'b00111100101111001100111011101101),
.pxl_out(pxl_out_658), .valid_out(valid_out_658) );

//Channel 659
conv_33 #(D, DATA_WIDTH) x659(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111100000101110000000100011010),
.kernel_01(32'b10111101001001110100100100010110),
.kernel_02(32'b00111100001010000001010001000100),
.kernel_03(32'b10111111001101011101111011100111),
.kernel_04(32'b10111100011010010010110001110101),
.kernel_05(32'b10111111000110000110101000010000),
.kernel_06(32'b00111101010000101110100101000001),
.kernel_07(32'b10111101101001010111000010000000),
.kernel_08(32'b00111101100011111011000011011111),
.pxl_out(pxl_out_659), .valid_out(valid_out_659) );

//Channel 660
conv_33 #(D, DATA_WIDTH) x660(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111101111001011101011110001001),
.kernel_01(32'b10111110100001001011101010000100),
.kernel_02(32'b10111110011111111010100100010100),
.kernel_03(32'b10111101110000111110100100100000),
.kernel_04(32'b10111111001100110100001000111100),
.kernel_05(32'b10111101100111101001011100100001),
.kernel_06(32'b10111011110101011110111011110101),
.kernel_07(32'b00111101001100000001111110110110),
.kernel_08(32'b00111110100010111010001110110111),
.pxl_out(pxl_out_660), .valid_out(valid_out_660) );

//Channel 661
conv_33 #(D, DATA_WIDTH) x661(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111011100110010011010111000100),
.kernel_01(32'b00111110000111110100111110011111),
.kernel_02(32'b10111011110101111001001000011000),
.kernel_03(32'b00111101100010110011101000000011),
.kernel_04(32'b10111101001111110011101101101001),
.kernel_05(32'b10111101111000011010111111110011),
.kernel_06(32'b00111111001101001110001100100000),
.kernel_07(32'b00111101010111101111010101001101),
.kernel_08(32'b10111101000100001111010011111000),
.pxl_out(pxl_out_661), .valid_out(valid_out_661) );

//Channel 662
conv_33 #(D, DATA_WIDTH) x662(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111101001011011101110111100011),
.kernel_01(32'b00111100011010100100011010110101),
.kernel_02(32'b00111101110011000110000000000010),
.kernel_03(32'b00111111010010001001111111001011),
.kernel_04(32'b10111101101000011101110101010110),
.kernel_05(32'b10111101011001010010101001000111),
.kernel_06(32'b10111101010001000011101010100110),
.kernel_07(32'b10111110000001101110100110010110),
.kernel_08(32'b10111101100111010101000010010000),
.pxl_out(pxl_out_662), .valid_out(valid_out_662) );

//Channel 663
conv_33 #(D, DATA_WIDTH) x663(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b00111101100100001110101101000000),
.kernel_01(32'b10111101101010101001001101100011),
.kernel_02(32'b10111110110001110111011011111111),
.kernel_03(32'b10111100101000001110111010001011),
.kernel_04(32'b00111101000110010000100111000011),
.kernel_05(32'b00111101010111000000101100100110),
.kernel_06(32'b10111100110100100000001011100100),
.kernel_07(32'b10111111001100110000001111100111),
.kernel_08(32'b10111110000110011110101100101011),
.pxl_out(pxl_out_663), .valid_out(valid_out_663) );

//Channel 664
conv_33 #(D, DATA_WIDTH) x664(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b10111101110001111011001010000111),
.kernel_01(32'b10111101000010001111010111100011),
.kernel_02(32'b10111011001111000101000101101100),
.kernel_03(32'b10111110000000001000110101101110),
.kernel_04(32'b00111101001100111011000100001110),
.kernel_05(32'b00111110101111100001000011101111),
.kernel_06(32'b00111110101001010111010101100010),
.kernel_07(32'b00111110011001110110001100110111),
.kernel_08(32'b10111100110000100000000111011001),
.pxl_out(pxl_out_664), .valid_out(valid_out_664) );

//Channel 665
conv_33 #(D, DATA_WIDTH) x665(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b10111101011011100101100010110011),
.kernel_01(32'b10111011110000111010101111011101),
.kernel_02(32'b10111101001001111001011100010111),
.kernel_03(32'b10111110011000000101100011110110),
.kernel_04(32'b10111101000001010111001111100110),
.kernel_05(32'b00111100100101100100000000001110),
.kernel_06(32'b10111101001101001010001011001010),
.kernel_07(32'b10111101101001011011000111010100),
.kernel_08(32'b10111111010110111101111010111110),
.pxl_out(pxl_out_665), .valid_out(valid_out_665) );

//Channel 666
conv_33 #(D, DATA_WIDTH) x666(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b00111101011100110011010100100101),
.kernel_01(32'b00111110000001111101000001111000),
.kernel_02(32'b00111100001011110010110111000001),
.kernel_03(32'b10111011001011110100011011011011),
.kernel_04(32'b10111111001000000110100110101111),
.kernel_05(32'b00111101011111000110110110101010),
.kernel_06(32'b10111110100111001001000010111100),
.kernel_07(32'b00111110001001111110011000101111),
.kernel_08(32'b10111100111110100010101110010100),
.pxl_out(pxl_out_666), .valid_out(valid_out_666) );

//Channel 667
conv_33 #(D, DATA_WIDTH) x667(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b10111100110010111110110100000110),
.kernel_01(32'b00111101011011110100000000010111),
.kernel_02(32'b10111101000101011100000100100010),
.kernel_03(32'b00111111010110011111111111110000),
.kernel_04(32'b00111101000100110111100001011001),
.kernel_05(32'b10111110000010101001000010000100),
.kernel_06(32'b10111110000010010100000011101110),
.kernel_07(32'b10111100000001010011011110010001),
.kernel_08(32'b00111101000110110100000011000001),
.pxl_out(pxl_out_667), .valid_out(valid_out_667) );

//Channel 668
conv_33 #(D, DATA_WIDTH) x668(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111011101000101010000111111010),
.kernel_01(32'b10111110000000100100010100110111),
.kernel_02(32'b10111111001001000000001001001000),
.kernel_03(32'b10111101000100010000001011011101),
.kernel_04(32'b00111101000000001011001000100110),
.kernel_05(32'b00111100110010011110111100110100),
.kernel_06(32'b10111110000001001110101100001100),
.kernel_07(32'b00111111000010100100111010011000),
.kernel_08(32'b00111001000000110000101110111010),
.pxl_out(pxl_out_668), .valid_out(valid_out_668) );

//Channel 669
conv_33 #(D, DATA_WIDTH) x669(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111101101011101010111100111000),
.kernel_01(32'b10111101111111100010100001000001),
.kernel_02(32'b00111101101010000111111100011101),
.kernel_03(32'b10111101001111110111110100010010),
.kernel_04(32'b00111110110011111010000010101101),
.kernel_05(32'b00111110001010010010010001001100),
.kernel_06(32'b00111101111000111110111001110001),
.kernel_07(32'b00111110001101110110111111011010),
.kernel_08(32'b00111101000111011011100000001011),
.pxl_out(pxl_out_669), .valid_out(valid_out_669) );

//Channel 670
conv_33 #(D, DATA_WIDTH) x670(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111110100111000101110011101010),
.kernel_01(32'b00111101111110111101011110001000),
.kernel_02(32'b00111100100000111010100000001111),
.kernel_03(32'b00111100111010100101110000101101),
.kernel_04(32'b10111110001111001000111101110101),
.kernel_05(32'b00111110111100011101101000011001),
.kernel_06(32'b10111100011011101101010101110111),
.kernel_07(32'b10111110100100010001001110000011),
.kernel_08(32'b10111111000000111010100010011101),
.pxl_out(pxl_out_670), .valid_out(valid_out_670) );

//Channel 671
conv_33 #(D, DATA_WIDTH) x671(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111110100101001011101100001110),
.kernel_01(32'b10111101101010000110100101001101),
.kernel_02(32'b00111101011101010110110101111001),
.kernel_03(32'b10111100111100110000100000001101),
.kernel_04(32'b10111110000011100101001100101000),
.kernel_05(32'b00111101000000000101011110010111),
.kernel_06(32'b00111100101111111100010100000010),
.kernel_07(32'b00111111000000001100000100110001),
.kernel_08(32'b00111110001111001111010100011101),
.pxl_out(pxl_out_671), .valid_out(valid_out_671) );

//Channel 672
conv_33 #(D, DATA_WIDTH) x672(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111110001110101110100001100010),
.kernel_01(32'b00111110101001110011001010010011),
.kernel_02(32'b10111101000110000001101111011010),
.kernel_03(32'b10111110110001001111000110110111),
.kernel_04(32'b10111110111111110000110101101101),
.kernel_05(32'b00111110010000011001100011011110),
.kernel_06(32'b10111110011101110101010110010001),
.kernel_07(32'b10111011101101011011101111101100),
.kernel_08(32'b00111101101111010001011010001101),
.pxl_out(pxl_out_672), .valid_out(valid_out_672) );

//Channel 673
conv_33 #(D, DATA_WIDTH) x673(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111111101100000000100011010000),
.kernel_01(32'b00111110000110010100101101111011),
.kernel_02(32'b10111110000010011010001001110011),
.kernel_03(32'b00111110001011010101100010100101),
.kernel_04(32'b10111101000011110000010110001111),
.kernel_05(32'b10111110010100010001001111100101),
.kernel_06(32'b00111101110001011001110000001100),
.kernel_07(32'b10111011100111000001001100111111),
.kernel_08(32'b10111101011100011100000100100100),
.pxl_out(pxl_out_673), .valid_out(valid_out_673) );

//Channel 674
conv_33 #(D, DATA_WIDTH) x674(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111110011000010110110011111000),
.kernel_01(32'b00111110100100110110000111010101),
.kernel_02(32'b10111101100011010101000101010111),
.kernel_03(32'b10111101001011001110001111000011),
.kernel_04(32'b10111111100110000101110000000011),
.kernel_05(32'b10111110010100111011110100000000),
.kernel_06(32'b00111110011110001001001010110001),
.kernel_07(32'b00111101111110101010011101011000),
.kernel_08(32'b10111100000001100001100101011111),
.pxl_out(pxl_out_674), .valid_out(valid_out_674) );

//Channel 675
conv_33 #(D, DATA_WIDTH) x675(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111110000010010000111011111000),
.kernel_01(32'b00111101101001011111010111110111),
.kernel_02(32'b10111011110001110110100001101011),
.kernel_03(32'b00111110101111101011010101001101),
.kernel_04(32'b00111100110001011111000100110011),
.kernel_05(32'b10111110000001101100000010111011),
.kernel_06(32'b00111100111111000110000011100110),
.kernel_07(32'b00111100010001110111010000111111),
.kernel_08(32'b10111110010111010110000010000001),
.pxl_out(pxl_out_675), .valid_out(valid_out_675) );

//Channel 676
conv_33 #(D, DATA_WIDTH) x676(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b10111110000100010111110101101010),
.kernel_01(32'b10111101100010000110111110001001),
.kernel_02(32'b00111011111100001101101000011110),
.kernel_03(32'b10111011000110110010110111111011),
.kernel_04(32'b00111100110010011110011011001000),
.kernel_05(32'b00111110101010110110110010010110),
.kernel_06(32'b10111100111001011110001101101011),
.kernel_07(32'b10111101001000101110111001010100),
.kernel_08(32'b00111101111010100010000010001111),
.pxl_out(pxl_out_676), .valid_out(valid_out_676) );

//Channel 677
conv_33 #(D, DATA_WIDTH) x677(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b10111100101010001011100001000001),
.kernel_01(32'b00111101100111001011000110011010),
.kernel_02(32'b10111101101000001101111011100111),
.kernel_03(32'b10111100011110101000111001001011),
.kernel_04(32'b00111110000100010010111101100100),
.kernel_05(32'b10111001111001110011001100101110),
.kernel_06(32'b00111101011010110011101111001011),
.kernel_07(32'b00111101001111100110010110000001),
.kernel_08(32'b10111110001011011001100011010110),
.pxl_out(pxl_out_677), .valid_out(valid_out_677) );

//Channel 678
conv_33 #(D, DATA_WIDTH) x678(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b10111110111011110100110111101110),
.kernel_01(32'b00111100111101011111100000100110),
.kernel_02(32'b10111101100111110101011000110100),
.kernel_03(32'b10111101000110011000011001011111),
.kernel_04(32'b00111100101101101000000101100001),
.kernel_05(32'b00111110001010110000000010101011),
.kernel_06(32'b00111011011111100100011000000010),
.kernel_07(32'b10111110001000100010100011000000),
.kernel_08(32'b10111100101100100010001000111010),
.pxl_out(pxl_out_678), .valid_out(valid_out_678) );

//Channel 679
conv_33 #(D, DATA_WIDTH) x679(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111110110011100100101100101010),
.kernel_01(32'b00111101110000010000100000101011),
.kernel_02(32'b10111100110110010110011100111100),
.kernel_03(32'b10111100010010011100001100001110),
.kernel_04(32'b00111101101111101110101010010001),
.kernel_05(32'b10111110011100100100001001001111),
.kernel_06(32'b10111101101000101000111101101011),
.kernel_07(32'b10111110011000010110110101100011),
.kernel_08(32'b10111100001011001101110000111011),
.pxl_out(pxl_out_679), .valid_out(valid_out_679) );

//Channel 680
conv_33 #(D, DATA_WIDTH) x680(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b10111101110000100110100111001000),
.kernel_01(32'b10111111001101101010101101001000),
.kernel_02(32'b00111101100111111000000101011101),
.kernel_03(32'b00111101011110000111000111111011),
.kernel_04(32'b00111101010010110110111110110011),
.kernel_05(32'b10111100010010000011100111010100),
.kernel_06(32'b00111110100011001111110111110111),
.kernel_07(32'b00111101101010000110011100001000),
.kernel_08(32'b00111110011010011000001100111011),
.pxl_out(pxl_out_680), .valid_out(valid_out_680) );

//Channel 681
conv_33 #(D, DATA_WIDTH) x681(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111100101110111000010010000100),
.kernel_01(32'b00111101010100111110111001110100),
.kernel_02(32'b10111110011010001000001101111100),
.kernel_03(32'b00111101101101011110011000100011),
.kernel_04(32'b10111100110100111010111010010010),
.kernel_05(32'b00111111000111110001001101110001),
.kernel_06(32'b00111110011000000000100111010101),
.kernel_07(32'b00111110101110100011100111011100),
.kernel_08(32'b10111110011111100100111010101000),
.pxl_out(pxl_out_681), .valid_out(valid_out_681) );

//Channel 682
conv_33 #(D, DATA_WIDTH) x682(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111100100111101111100110010011),
.kernel_01(32'b10111011100000101010110010001101),
.kernel_02(32'b10111101000011101110101001101101),
.kernel_03(32'b10111101100011001000001111111110),
.kernel_04(32'b10111111010001100100101111000000),
.kernel_05(32'b10111101111111001110111011010010),
.kernel_06(32'b00111100101110010101110010001100),
.kernel_07(32'b00111101100100110110001100001001),
.kernel_08(32'b00111101110001111111010100000000),
.pxl_out(pxl_out_682), .valid_out(valid_out_682) );

//Channel 683
conv_33 #(D, DATA_WIDTH) x683(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111110100110001000000100110011),
.kernel_01(32'b10111110000010110001110100011011),
.kernel_02(32'b00111101100000000000110101100001),
.kernel_03(32'b10111100001101000100111000101111),
.kernel_04(32'b00111101101000011101001000100000),
.kernel_05(32'b10111101110010001100111010010010),
.kernel_06(32'b10111110000110111010000000101011),
.kernel_07(32'b10111101010001011110010110101111),
.kernel_08(32'b10111100010001000100001111100111),
.pxl_out(pxl_out_683), .valid_out(valid_out_683) );

//Channel 684
conv_33 #(D, DATA_WIDTH) x684(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b10111101000001110101101101110100),
.kernel_01(32'b10111101101101010110010001010111),
.kernel_02(32'b00111101100111100000100001111000),
.kernel_03(32'b00111101010101010110011011111110),
.kernel_04(32'b00111100110101001011111100000001),
.kernel_05(32'b10111101100101001001011101101000),
.kernel_06(32'b00111100100100011101110100101000),
.kernel_07(32'b10111100100111101111100110011011),
.kernel_08(32'b10111100100001001010010001100000),
.pxl_out(pxl_out_684), .valid_out(valid_out_684) );

//Channel 685
conv_33 #(D, DATA_WIDTH) x685(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b10111101011010110110000000110010),
.kernel_01(32'b00111110010111100001100011001110),
.kernel_02(32'b00111101100101001011000000001001),
.kernel_03(32'b10111101010010011011010110101100),
.kernel_04(32'b10111100001110111101111100001110),
.kernel_05(32'b00111101010000010011100000011111),
.kernel_06(32'b00111101010000110111111110101000),
.kernel_07(32'b00111100111100001111011111010110),
.kernel_08(32'b00111101101111001000110011001101),
.pxl_out(pxl_out_685), .valid_out(valid_out_685) );

//Channel 686
conv_33 #(D, DATA_WIDTH) x686(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b10111100111010110111001000011110),
.kernel_01(32'b10111100110100101111010001101111),
.kernel_02(32'b00111100100011000101000011100101),
.kernel_03(32'b00111101100010100000000000001010),
.kernel_04(32'b00111101001010000101101000111011),
.kernel_05(32'b10111101001110110000010100111110),
.kernel_06(32'b10111011111100101000101011000111),
.kernel_07(32'b10111100110101000011101000011001),
.kernel_08(32'b10111110000010101101110001001111),
.pxl_out(pxl_out_686), .valid_out(valid_out_686) );

//Channel 687
conv_33 #(D, DATA_WIDTH) x687(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b10111101111001111001110110010011),
.kernel_01(32'b00111101000011011111000100001100),
.kernel_02(32'b10111101111100110100101110100011),
.kernel_03(32'b10111101001110111111000000001011),
.kernel_04(32'b00111100110010101101010111101110),
.kernel_05(32'b00111101000111101010101101100000),
.kernel_06(32'b00111101101011001000101101000010),
.kernel_07(32'b00111011100100100101001001010000),
.kernel_08(32'b00111101111101110001011000111010),
.pxl_out(pxl_out_687), .valid_out(valid_out_687) );

//Channel 688
conv_33 #(D, DATA_WIDTH) x688(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b00111101101011011110100110010000),
.kernel_01(32'b10111101001111001110001001110110),
.kernel_02(32'b00111100101110101000001101001001),
.kernel_03(32'b10111100110101111000011100101010),
.kernel_04(32'b10111100111111110011011001101101),
.kernel_05(32'b10111101010000010000010110100001),
.kernel_06(32'b00111101110001010101010110101000),
.kernel_07(32'b10111101010011111101010111111110),
.kernel_08(32'b10111100000110111110011110011011),
.pxl_out(pxl_out_688), .valid_out(valid_out_688) );

//Channel 689
conv_33 #(D, DATA_WIDTH) x689(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b00111110000001100100101011111000),
.kernel_01(32'b00111101111101011110010111110111),
.kernel_02(32'b00111100110011001000101011111111),
.kernel_03(32'b10111101000000011001110010010100),
.kernel_04(32'b00111101110011110001000011011000),
.kernel_05(32'b00111100011000110001111000101000),
.kernel_06(32'b10111001001110011100111111001110),
.kernel_07(32'b00111100100010110111011100001101),
.kernel_08(32'b00111100111100100111000001010101),
.pxl_out(pxl_out_689), .valid_out(valid_out_689) );

//Channel 690
conv_33 #(D, DATA_WIDTH) x690(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b00111011110101100011110101000100),
.kernel_01(32'b00111010001100000001101110101001),
.kernel_02(32'b00111100110011111111111110111000),
.kernel_03(32'b10111100111001101010110110001000),
.kernel_04(32'b10111101110000100100010011011111),
.kernel_05(32'b10111110000101001001111111001010),
.kernel_06(32'b00111100111000101100000001100010),
.kernel_07(32'b00111101111101001010101011101011),
.kernel_08(32'b00111100010010010000100111110010),
.pxl_out(pxl_out_690), .valid_out(valid_out_690) );

//Channel 691
conv_33 #(D, DATA_WIDTH) x691(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111101010110000001100010000001),
.kernel_01(32'b10111101000011110001101000000101),
.kernel_02(32'b10111100101001110100011111000101),
.kernel_03(32'b00111101001110110101101001100111),
.kernel_04(32'b00111011111001110001100010000011),
.kernel_05(32'b10111100100101110001011110001100),
.kernel_06(32'b00111101000000111011101010010100),
.kernel_07(32'b10111100111100110001100110001100),
.kernel_08(32'b00111101100010011000011000000000),
.pxl_out(pxl_out_691), .valid_out(valid_out_691) );

//Channel 692
conv_33 #(D, DATA_WIDTH) x692(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111101100011001011111100010010),
.kernel_01(32'b00111100011001001000111000101101),
.kernel_02(32'b10111110000001100001111011110001),
.kernel_03(32'b00111110000011110100110000001001),
.kernel_04(32'b10111011111100100001110011100111),
.kernel_05(32'b10111101101001001000000000110110),
.kernel_06(32'b10111100101101010101100011100010),
.kernel_07(32'b00111101110001010001111000000101),
.kernel_08(32'b10111101101000001010110111001000),
.pxl_out(pxl_out_692), .valid_out(valid_out_692) );

//Channel 693
conv_33 #(D, DATA_WIDTH) x693(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b10111101010110011111001011000010),
.kernel_01(32'b00111011010010100110111000001101),
.kernel_02(32'b10111100101111101001011001101010),
.kernel_03(32'b10111101100011111010101100000110),
.kernel_04(32'b10111100101011101110000010000000),
.kernel_05(32'b10111100011110000101000001000100),
.kernel_06(32'b10111101101101001101001100111101),
.kernel_07(32'b10111101010010011011100100111101),
.kernel_08(32'b00111101110111010000101001111010),
.pxl_out(pxl_out_693), .valid_out(valid_out_693) );

//Channel 694
conv_33 #(D, DATA_WIDTH) x694(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111101010000110100001011111001),
.kernel_01(32'b00111101011010110011110100101111),
.kernel_02(32'b00111101000110111100011011010001),
.kernel_03(32'b00111101111000001001011011011010),
.kernel_04(32'b00111101000010000000000011011101),
.kernel_05(32'b10111110000100101011111000110010),
.kernel_06(32'b10111101010101001110101000101011),
.kernel_07(32'b10111100111111010100100110100000),
.kernel_08(32'b00111101111100100110100111000111),
.pxl_out(pxl_out_694), .valid_out(valid_out_694) );

//Channel 695
conv_33 #(D, DATA_WIDTH) x695(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111100110011011110111111101100),
.kernel_01(32'b00111100100100111110001101100011),
.kernel_02(32'b00111100101110110000011100010100),
.kernel_03(32'b10111101000000000101010010110011),
.kernel_04(32'b00111101001001010010101011010100),
.kernel_05(32'b00111100010111011111010001010100),
.kernel_06(32'b10111110000100000011000100011101),
.kernel_07(32'b10111110011111110011110011111101),
.kernel_08(32'b00111101011100001101011111110111),
.pxl_out(pxl_out_695), .valid_out(valid_out_695) );

//Channel 696
conv_33 #(D, DATA_WIDTH) x696(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111100110001111001101100011100),
.kernel_01(32'b10111100111000001111010001110111),
.kernel_02(32'b10111101011111100011010111100100),
.kernel_03(32'b00111101101100001110000010111110),
.kernel_04(32'b00111101000011010110111110010110),
.kernel_05(32'b10111110001000010111011110100110),
.kernel_06(32'b10111101011101101001001100011011),
.kernel_07(32'b00111100011100101110001011000100),
.kernel_08(32'b10111011111010010000010100111111),
.pxl_out(pxl_out_696), .valid_out(valid_out_696) );

//Channel 697
conv_33 #(D, DATA_WIDTH) x697(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b10111100001100000110000011110001),
.kernel_01(32'b10111101000111101110111000111001),
.kernel_02(32'b10111101110111100000010010010001),
.kernel_03(32'b10111101010001001101010000111010),
.kernel_04(32'b00111100011001110100111000101100),
.kernel_05(32'b10111101101010101010000000110001),
.kernel_06(32'b00111101101000000001001000110000),
.kernel_07(32'b00111011010000101010000110110000),
.kernel_08(32'b00111110000110111000110111000111),
.pxl_out(pxl_out_697), .valid_out(valid_out_697) );

//Channel 698
conv_33 #(D, DATA_WIDTH) x698(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111100001001010101111101011110),
.kernel_01(32'b10111101000110100101000001010011),
.kernel_02(32'b00111101111000010010111001011010),
.kernel_03(32'b10111011111111101000101010110110),
.kernel_04(32'b00111101011011000101011111001100),
.kernel_05(32'b00111101000001000001111011100110),
.kernel_06(32'b00111101001100111000100011100110),
.kernel_07(32'b10111010100101010100100010100011),
.kernel_08(32'b10111101000110000110110110100001),
.pxl_out(pxl_out_698), .valid_out(valid_out_698) );

//Channel 699
conv_33 #(D, DATA_WIDTH) x699(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111101001000000100101111010101),
.kernel_01(32'b10111101011100000000101011001101),
.kernel_02(32'b10111011011111011111100010000111),
.kernel_03(32'b10111110001100010101011100111111),
.kernel_04(32'b10111101010101100100010110011110),
.kernel_05(32'b00111100101000010011011111111111),
.kernel_06(32'b10111101100110000011010111110100),
.kernel_07(32'b10111101101011000111000000000111),
.kernel_08(32'b00111100111100111011101011000011),
.pxl_out(pxl_out_699), .valid_out(valid_out_699) );

//Channel 700
conv_33 #(D, DATA_WIDTH) x700(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111101100111001011100110011000),
.kernel_01(32'b10111100011010100100011101111011),
.kernel_02(32'b00111101010100100001101000001101),
.kernel_03(32'b00111100101001001011010100010000),
.kernel_04(32'b10111101001101111000010110110101),
.kernel_05(32'b10111101011000100010111010101111),
.kernel_06(32'b00111101010100111001100100100101),
.kernel_07(32'b00111100010000111010100100011000),
.kernel_08(32'b10111110001110001011100000001100),
.pxl_out(pxl_out_700), .valid_out(valid_out_700) );

//Channel 701
conv_33 #(D, DATA_WIDTH) x701(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111110000010001101000001100100),
.kernel_01(32'b00111100000010000011100000110110),
.kernel_02(32'b00111101001001000111100111001011),
.kernel_03(32'b10111101100110100111101010110110),
.kernel_04(32'b00111101101001011011010010000101),
.kernel_05(32'b00111110001001011011110111100110),
.kernel_06(32'b10111110000000010100110111011101),
.kernel_07(32'b00111101000011001100001010010010),
.kernel_08(32'b10111100000110000110010000011000),
.pxl_out(pxl_out_701), .valid_out(valid_out_701) );

//Channel 702
conv_33 #(D, DATA_WIDTH) x702(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111100100011110000100001101110),
.kernel_01(32'b10111101111111011100000011111001),
.kernel_02(32'b00111101001001101000000001100101),
.kernel_03(32'b10111101000011010010010101111000),
.kernel_04(32'b10111101011111011000000001011110),
.kernel_05(32'b00111010111101110010010010101010),
.kernel_06(32'b00111101011010111101111101110010),
.kernel_07(32'b00111011110001011100011101000001),
.kernel_08(32'b10111100101011001001100011000000),
.pxl_out(pxl_out_702), .valid_out(valid_out_702) );

//Channel 703
conv_33 #(D, DATA_WIDTH) x703(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111100010100011000000000101101),
.kernel_01(32'b00111101000000000111001100001110),
.kernel_02(32'b00111110001101110001000011100110),
.kernel_03(32'b00111110000000101101000100001011),
.kernel_04(32'b10111101111100111001111011101101),
.kernel_05(32'b10111101000100010111000101110101),
.kernel_06(32'b00111101100010011001010101110100),
.kernel_07(32'b00111101001011100111111011100110),
.kernel_08(32'b10111100101100100010111011001010),
.pxl_out(pxl_out_703), .valid_out(valid_out_703) );

//Channel 704
conv_33 #(D, DATA_WIDTH) x704(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b00111010110010010100010000011001),
.kernel_01(32'b10111101101000011101101011111011),
.kernel_02(32'b00111101010010010100100001110101),
.kernel_03(32'b10111100000110011111111001011010),
.kernel_04(32'b10111100101100000110101110000101),
.kernel_05(32'b10111101111100001000010101100100),
.kernel_06(32'b00111100100011110001100001101011),
.kernel_07(32'b00111101010110001111001011111111),
.kernel_08(32'b00111011111100010000010010000101),
.pxl_out(pxl_out_704), .valid_out(valid_out_704) );

//Channel 705
conv_33 #(D, DATA_WIDTH) x705(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111101001010101011111111001000),
.kernel_01(32'b00111101000101000011100011010001),
.kernel_02(32'b10111101010010101101001101110000),
.kernel_03(32'b00111101011001000000110001010100),
.kernel_04(32'b10111100111111010101011100111010),
.kernel_05(32'b10111010000011110010101010110101),
.kernel_06(32'b10111101010001111100001011101101),
.kernel_07(32'b00111110010000001000110011111100),
.kernel_08(32'b10111100111011001111000011011110),
.pxl_out(pxl_out_705), .valid_out(valid_out_705) );

//Channel 706
conv_33 #(D, DATA_WIDTH) x706(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111001110010101100011011111110),
.kernel_01(32'b10111011000000101111010101001000),
.kernel_02(32'b00111101000010100011111101000101),
.kernel_03(32'b10111101110011010000011001001000),
.kernel_04(32'b00111100101000001001001101010100),
.kernel_05(32'b10111011001110110001000101001011),
.kernel_06(32'b10111100000010101010110110010111),
.kernel_07(32'b10111101011001001100110011000001),
.kernel_08(32'b10111110000011111100000011110110),
.pxl_out(pxl_out_706), .valid_out(valid_out_706) );

//Channel 707
conv_33 #(D, DATA_WIDTH) x707(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111100111001110101011011111000),
.kernel_01(32'b10111110010101100010010111000000),
.kernel_02(32'b10111101101001111010001010011111),
.kernel_03(32'b00111100110000000101001011010000),
.kernel_04(32'b10111110000011111011010110111111),
.kernel_05(32'b10111101111011101110000101000101),
.kernel_06(32'b10111100110010111001110111111101),
.kernel_07(32'b00111101101010011000101010101001),
.kernel_08(32'b10111000101110110010001000000010),
.pxl_out(pxl_out_707), .valid_out(valid_out_707) );

//Channel 708
conv_33 #(D, DATA_WIDTH) x708(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111100011000101001110100011111),
.kernel_01(32'b00111110010110101001001110101110),
.kernel_02(32'b10111101000001001010110011111001),
.kernel_03(32'b00111110001011101000001000001010),
.kernel_04(32'b00111101111111101000001011100111),
.kernel_05(32'b10111101101111101100100011001100),
.kernel_06(32'b00111101001010011001101111011100),
.kernel_07(32'b10111110000011110111010010001110),
.kernel_08(32'b00111101110001001011001001001100),
.pxl_out(pxl_out_708), .valid_out(valid_out_708) );

//Channel 709
conv_33 #(D, DATA_WIDTH) x709(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111000010111000100101001000100),
.kernel_01(32'b00111101010010000000111001101100),
.kernel_02(32'b00111101110111011100011111001111),
.kernel_03(32'b10111101110101011111111110011110),
.kernel_04(32'b10111101011001010011101011100011),
.kernel_05(32'b00111101001011000001111101001011),
.kernel_06(32'b00111101100011100011110100010000),
.kernel_07(32'b10111100011110010011111110000101),
.kernel_08(32'b00111101000011101011000000011110),
.pxl_out(pxl_out_709), .valid_out(valid_out_709) );

//Channel 710
conv_33 #(D, DATA_WIDTH) x710(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111100100110101111101010110010),
.kernel_01(32'b00111101011100111110001100011110),
.kernel_02(32'b10111100000111110011000011101100),
.kernel_03(32'b10111101100010001111111100000011),
.kernel_04(32'b00111011010110011010011110010100),
.kernel_05(32'b10111100001100100110110011100001),
.kernel_06(32'b10111101100110110101011011000110),
.kernel_07(32'b10111101000010000110010100001100),
.kernel_08(32'b10111100001011101001011000010101),
.pxl_out(pxl_out_710), .valid_out(valid_out_710) );

//Channel 711
conv_33 #(D, DATA_WIDTH) x711(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111101001010010000010100011010),
.kernel_01(32'b10111100110110000010111000001011),
.kernel_02(32'b00111101110101111010110111111001),
.kernel_03(32'b10111100100010011111000110110110),
.kernel_04(32'b10111101001111010100101101111001),
.kernel_05(32'b10111010111010000000110011010011),
.kernel_06(32'b10111101100010100000111001010001),
.kernel_07(32'b10111101110010101110011010111000),
.kernel_08(32'b00111100100011011000011110110000),
.pxl_out(pxl_out_711), .valid_out(valid_out_711) );

//Channel 712
conv_33 #(D, DATA_WIDTH) x712(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b10111110000011110101101111110011),
.kernel_01(32'b10111110001001111111111111100100),
.kernel_02(32'b00111100011101111101101100110010),
.kernel_03(32'b00111100111111000000110101000010),
.kernel_04(32'b00111100011000110111010111111111),
.kernel_05(32'b10111110001110101010001100000101),
.kernel_06(32'b10111100111101100101110011110000),
.kernel_07(32'b10111100101111001001011110111010),
.kernel_08(32'b10111100011100110000010000110010),
.pxl_out(pxl_out_712), .valid_out(valid_out_712) );

//Channel 713
conv_33 #(D, DATA_WIDTH) x713(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111101111010111010010101001100),
.kernel_01(32'b10111100101010011100010010100110),
.kernel_02(32'b10111011001011100101000000101101),
.kernel_03(32'b10111100011010011111010100110100),
.kernel_04(32'b10111011100101101000000011001001),
.kernel_05(32'b00111101110111001111111110111111),
.kernel_06(32'b10111110000100000100111100000100),
.kernel_07(32'b10111101011110101111000101101111),
.kernel_08(32'b00111100100000001100001000011000),
.pxl_out(pxl_out_713), .valid_out(valid_out_713) );

//Channel 714
conv_33 #(D, DATA_WIDTH) x714(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111101110111100011101100100011),
.kernel_01(32'b00111100100100100000101110101110),
.kernel_02(32'b10111100111111001100011111101000),
.kernel_03(32'b00111100010110111011010110010111),
.kernel_04(32'b10111101100001110011110111100101),
.kernel_05(32'b10111101001111100101010001000110),
.kernel_06(32'b00111101011000101111000000110111),
.kernel_07(32'b00111100100011011001011110101101),
.kernel_08(32'b00111100101101100111010110001111),
.pxl_out(pxl_out_714), .valid_out(valid_out_714) );

//Channel 715
conv_33 #(D, DATA_WIDTH) x715(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b00111110001000110100100100110000),
.kernel_01(32'b00111101010100010101001001010100),
.kernel_02(32'b00111100101000010100001101001110),
.kernel_03(32'b10111110000010011011110111101101),
.kernel_04(32'b10111110001001000111000110001111),
.kernel_05(32'b10111101100101001101101000011101),
.kernel_06(32'b10111110010000011010011000100010),
.kernel_07(32'b10111110101010011101101100100000),
.kernel_08(32'b10111100110110010100011101110111),
.pxl_out(pxl_out_715), .valid_out(valid_out_715) );

//Channel 716
conv_33 #(D, DATA_WIDTH) x716(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b10111101011010000100110011101010),
.kernel_01(32'b10111011101000100110000111101010),
.kernel_02(32'b00111101111110011101010110101110),
.kernel_03(32'b00111110001111100001110100001001),
.kernel_04(32'b00111110000100100011010000010110),
.kernel_05(32'b10111110000110111100101010000100),
.kernel_06(32'b00111101010011101001111111010010),
.kernel_07(32'b00111101011100100100001101100001),
.kernel_08(32'b10111101100100111110010000100000),
.pxl_out(pxl_out_716), .valid_out(valid_out_716) );

//Channel 717
conv_33 #(D, DATA_WIDTH) x717(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111101001010110101111011010001),
.kernel_01(32'b00111110100110100000001110001100),
.kernel_02(32'b00111101110000001101110000000111),
.kernel_03(32'b00111011100010010101011010010111),
.kernel_04(32'b10111110100101101001010001110100),
.kernel_05(32'b00111110011100101010100011100010),
.kernel_06(32'b10111101100001101000101111100010),
.kernel_07(32'b00111100110101010010110111110000),
.kernel_08(32'b00111110000011111101100101100100),
.pxl_out(pxl_out_717), .valid_out(valid_out_717) );

//Channel 718
conv_33 #(D, DATA_WIDTH) x718(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111110000110000100100101011101),
.kernel_01(32'b10111110010001010000000001110100),
.kernel_02(32'b00111101001110001001010111001000),
.kernel_03(32'b00111110000001011001011011010011),
.kernel_04(32'b00111101110110110101110111001100),
.kernel_05(32'b00111101100111000011000000111100),
.kernel_06(32'b00111100101001011110011110110111),
.kernel_07(32'b00111101101110101111100010000111),
.kernel_08(32'b00111100110010000111100000100110),
.pxl_out(pxl_out_718), .valid_out(valid_out_718) );

//Channel 719
conv_33 #(D, DATA_WIDTH) x719(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b10111101100111010110101011010111),
.kernel_01(32'b00111101101010001110111000100001),
.kernel_02(32'b00111101100110011010011001001000),
.kernel_03(32'b00111011101100011101110111111001),
.kernel_04(32'b10111101100111000111010100001011),
.kernel_05(32'b00111100111001100001111011110010),
.kernel_06(32'b00111100011000100000100111111011),
.kernel_07(32'b00111101100000000111101010000100),
.kernel_08(32'b10111011100000011001101110110000),
.pxl_out(pxl_out_719), .valid_out(valid_out_719) );

//Channel 720
conv_33 #(D, DATA_WIDTH) x720(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b00111101011110101110001001100011),
.kernel_01(32'b00111101101101101111110011100101),
.kernel_02(32'b00111011110100110100011011001111),
.kernel_03(32'b00111101001101001010001000110011),
.kernel_04(32'b10111101001100011100010010111011),
.kernel_05(32'b00111101011110111111110011111010),
.kernel_06(32'b10111101001000111101111101100000),
.kernel_07(32'b10111100110111011110010011100101),
.kernel_08(32'b10111100101010111011101010000100),
.pxl_out(pxl_out_720), .valid_out(valid_out_720) );

//Channel 721
conv_33 #(D, DATA_WIDTH) x721(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111110000001100000111110011010),
.kernel_01(32'b10111110001110010100000000000111),
.kernel_02(32'b00111101101011010001010100011001),
.kernel_03(32'b10111100010100111111100100111100),
.kernel_04(32'b10111101100010101100001110001010),
.kernel_05(32'b10111100101010000000000110111010),
.kernel_06(32'b10111101100101011010010110100001),
.kernel_07(32'b10111101110111110000111010100111),
.kernel_08(32'b00111100100111111010111111010101),
.pxl_out(pxl_out_721), .valid_out(valid_out_721) );

//Channel 722
conv_33 #(D, DATA_WIDTH) x722(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b00111101011110110100101011111000),
.kernel_01(32'b10111101001001101101011010010110),
.kernel_02(32'b10111100111010101101011011010110),
.kernel_03(32'b00111110010111100101100011111011),
.kernel_04(32'b10111101001111100111100010110110),
.kernel_05(32'b00111110010001111000011011000101),
.kernel_06(32'b10111011101100101110101010101001),
.kernel_07(32'b10111110001001110011101000100110),
.kernel_08(32'b00111100100000011111110110101101),
.pxl_out(pxl_out_722), .valid_out(valid_out_722) );

//Channel 723
conv_33 #(D, DATA_WIDTH) x723(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111110000111100011010001011000),
.kernel_01(32'b00111101100011100110011010110110),
.kernel_02(32'b10111100100101101101011100111100),
.kernel_03(32'b00111111011001100010010000101000),
.kernel_04(32'b00111100010111011011000111100011),
.kernel_05(32'b00111110001010011111000010000111),
.kernel_06(32'b10111101110100000011010111000010),
.kernel_07(32'b00111101000101110101101010000010),
.kernel_08(32'b00111101110100110101100110101101),
.pxl_out(pxl_out_723), .valid_out(valid_out_723) );

//Channel 724
conv_33 #(D, DATA_WIDTH) x724(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111110000110101000000010011101),
.kernel_01(32'b00111100110100100111010101001001),
.kernel_02(32'b00111101100101000011001001100010),
.kernel_03(32'b10111110111100101000000100111111),
.kernel_04(32'b10111101011011101010110001110001),
.kernel_05(32'b00111100110110100011100110111010),
.kernel_06(32'b00111101100110101001001000001010),
.kernel_07(32'b00111101000001010100110001110000),
.kernel_08(32'b00111101101011110001101111000010),
.pxl_out(pxl_out_724), .valid_out(valid_out_724) );

//Channel 725
conv_33 #(D, DATA_WIDTH) x725(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111100000001111001010110100001),
.kernel_01(32'b10111101000011000110110100110100),
.kernel_02(32'b00111100111110011110100001100110),
.kernel_03(32'b10111101011001111000101010111011),
.kernel_04(32'b10111100110101001100100100001100),
.kernel_05(32'b10111101100101010011110110111010),
.kernel_06(32'b10111110101101110110110101110000),
.kernel_07(32'b10111101010110101100100101100101),
.kernel_08(32'b10111110001001110110011011010000),
.pxl_out(pxl_out_725), .valid_out(valid_out_725) );

//Channel 726
conv_33 #(D, DATA_WIDTH) x726(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b00111101000101010111001111001110),
.kernel_01(32'b10111101101110101110000111110001),
.kernel_02(32'b10111110101011001001001000100111),
.kernel_03(32'b10111110001011000011110001101100),
.kernel_04(32'b00111110010100101001100010011110),
.kernel_05(32'b00111100110000011111010100100110),
.kernel_06(32'b00111011101111001111111110001011),
.kernel_07(32'b10111101000101111001011011011101),
.kernel_08(32'b10111101010100011001000110000010),
.pxl_out(pxl_out_726), .valid_out(valid_out_726) );

//Channel 727
conv_33 #(D, DATA_WIDTH) x727(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111101010011100100010011010011),
.kernel_01(32'b10111011100110011010010110011000),
.kernel_02(32'b00111100001111000101100100010101),
.kernel_03(32'b00111010011011000101101110110011),
.kernel_04(32'b00111100110000111010011010000101),
.kernel_05(32'b10111110000000111001110110001100),
.kernel_06(32'b10111101100110101101100000110001),
.kernel_07(32'b10111100111011001010100001000001),
.kernel_08(32'b00111011011111110110101111101000),
.pxl_out(pxl_out_727), .valid_out(valid_out_727) );

//Channel 728
conv_33 #(D, DATA_WIDTH) x728(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b10111011111100110100001011011010),
.kernel_01(32'b10111110001010000000111011100111),
.kernel_02(32'b10111101010001101000110010110100),
.kernel_03(32'b00111110010110111110100100011110),
.kernel_04(32'b00111101101100011100001011101111),
.kernel_05(32'b00111010100111000010001110100000),
.kernel_06(32'b00111100100010011110000010111010),
.kernel_07(32'b10111101110010101100000110101110),
.kernel_08(32'b10111101100001001111011010100011),
.pxl_out(pxl_out_728), .valid_out(valid_out_728) );

//Channel 729
conv_33 #(D, DATA_WIDTH) x729(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b10111100100010110010111111100101),
.kernel_01(32'b00111101110100110111101000010011),
.kernel_02(32'b10111101011000111001011001001111),
.kernel_03(32'b10111100100110011010101110110101),
.kernel_04(32'b00111100110000011110110111110101),
.kernel_05(32'b10111101111101100101101000101110),
.kernel_06(32'b10111100110011111101101111111010),
.kernel_07(32'b10111101111110111111100000110000),
.kernel_08(32'b00111110001001101011100000101010),
.pxl_out(pxl_out_729), .valid_out(valid_out_729) );

//Channel 730
conv_33 #(D, DATA_WIDTH) x730(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b00111101110001010111000010010000),
.kernel_01(32'b00111101101011010110111010011111),
.kernel_02(32'b10111101001000010110110000100001),
.kernel_03(32'b10111011111100100010010010110001),
.kernel_04(32'b10111101110110011100111011001010),
.kernel_05(32'b00111101110110110000111000110100),
.kernel_06(32'b10111101111010110011100110011001),
.kernel_07(32'b00111101000101000111011101010100),
.kernel_08(32'b10111101100011011100101011111100),
.pxl_out(pxl_out_730), .valid_out(valid_out_730) );

//Channel 731
conv_33 #(D, DATA_WIDTH) x731(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b10111101000100001010110110001000),
.kernel_01(32'b10111101001111010110111011110101),
.kernel_02(32'b10111101111011011101011101111101),
.kernel_03(32'b10111110010101010111000111011010),
.kernel_04(32'b10111101000011111111111101111010),
.kernel_05(32'b10111011110010111010100100111010),
.kernel_06(32'b00111110001001111000000110010110),
.kernel_07(32'b10111110011101110001100000101000),
.kernel_08(32'b00111101010010001111010100000110),
.pxl_out(pxl_out_731), .valid_out(valid_out_731) );

//Channel 732
conv_33 #(D, DATA_WIDTH) x732(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111101000111000011000110101000),
.kernel_01(32'b10111110011011110111101100101001),
.kernel_02(32'b10111101010010100000010110011111),
.kernel_03(32'b10111100110110011000111110001001),
.kernel_04(32'b00111101100010011101000001010100),
.kernel_05(32'b10111101100101100111111011000001),
.kernel_06(32'b10111100110110001100001011110111),
.kernel_07(32'b10111101000111001110111111101101),
.kernel_08(32'b00111100100101010110101000001100),
.pxl_out(pxl_out_732), .valid_out(valid_out_732) );

//Channel 733
conv_33 #(D, DATA_WIDTH) x733(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111101000100110111101010100101),
.kernel_01(32'b10111101000000001001011010100110),
.kernel_02(32'b00111110001000110010011110011011),
.kernel_03(32'b00111011110111001100101111100011),
.kernel_04(32'b10111101001011000110101111100101),
.kernel_05(32'b10111100100111101010101000000110),
.kernel_06(32'b10111101000001000101111011110101),
.kernel_07(32'b10111100100010010001010101100101),
.kernel_08(32'b10111101011011110111110101110000),
.pxl_out(pxl_out_733), .valid_out(valid_out_733) );

//Channel 734
conv_33 #(D, DATA_WIDTH) x734(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111100110100011110110011001011),
.kernel_01(32'b00111100101101101100111001010101),
.kernel_02(32'b00111100110010100111000000100110),
.kernel_03(32'b10111100101101110001001110011010),
.kernel_04(32'b10111100110101110101011100100001),
.kernel_05(32'b00111100010110001101111100011011),
.kernel_06(32'b00111100001101011111111011100100),
.kernel_07(32'b00111011110010001110000000000111),
.kernel_08(32'b00111100110001100110111111001100),
.pxl_out(pxl_out_734), .valid_out(valid_out_734) );

//Channel 735
conv_33 #(D, DATA_WIDTH) x735(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b00111011110011101011001110000001),
.kernel_01(32'b10111100001000111101001011101110),
.kernel_02(32'b10111011011111000010100000000000),
.kernel_03(32'b00111101111011010000110101111101),
.kernel_04(32'b00111100101010110101010101001000),
.kernel_05(32'b00111100010100100010010011111000),
.kernel_06(32'b00111100010110111010000101110010),
.kernel_07(32'b10111100100110001111011011110001),
.kernel_08(32'b10111101001110100000000101111100),
.pxl_out(pxl_out_735), .valid_out(valid_out_735) );

//Channel 736
conv_33 #(D, DATA_WIDTH) x736(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111101000001110110010111011001),
.kernel_01(32'b00111101010001001111000101111010),
.kernel_02(32'b10111011110100111101000000001010),
.kernel_03(32'b10111101001001001100001101100101),
.kernel_04(32'b00111100111110000101001101011000),
.kernel_05(32'b00111100000001110100100000111110),
.kernel_06(32'b10111101100011010001010011010101),
.kernel_07(32'b10111110001001100000110000010111),
.kernel_08(32'b00111100110011000000011111101100),
.pxl_out(pxl_out_736), .valid_out(valid_out_736) );

//Channel 737
conv_33 #(D, DATA_WIDTH) x737(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111110000010001100000101000001),
.kernel_01(32'b10111100110010111100110110001101),
.kernel_02(32'b10111101110100110101110011011111),
.kernel_03(32'b10111100011110101110001110101000),
.kernel_04(32'b00111100101010001001110000011100),
.kernel_05(32'b10111101010110111100010111001101),
.kernel_06(32'b10111101110001101001100100011001),
.kernel_07(32'b10111101001101010101000111000101),
.kernel_08(32'b00111101100111011001000011000001),
.pxl_out(pxl_out_737), .valid_out(valid_out_737) );

//Channel 738
conv_33 #(D, DATA_WIDTH) x738(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b00111100100110111100010001101100),
.kernel_01(32'b00111101100101110001000011001010),
.kernel_02(32'b10111100000100111111010000001000),
.kernel_03(32'b00111101001011001010100010101111),
.kernel_04(32'b10111110001110010100100000100110),
.kernel_05(32'b00111110000101110000111101010100),
.kernel_06(32'b10111101001111111110100001100111),
.kernel_07(32'b10111101110101001011111001110100),
.kernel_08(32'b10111101100011000111110100101010),
.pxl_out(pxl_out_738), .valid_out(valid_out_738) );

//Channel 739
conv_33 #(D, DATA_WIDTH) x739(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111100110010100111001001110010),
.kernel_01(32'b00111101011000101101010010100000),
.kernel_02(32'b10111110000001001111111110100101),
.kernel_03(32'b10111101101000010100001110111001),
.kernel_04(32'b00111101011110011000111111101100),
.kernel_05(32'b10111101010011011011000111000000),
.kernel_06(32'b10111101010111101100010100001010),
.kernel_07(32'b10111101101101110110101110100100),
.kernel_08(32'b10111101001001110011011100010000),
.pxl_out(pxl_out_739), .valid_out(valid_out_739) );

//Channel 740
conv_33 #(D, DATA_WIDTH) x740(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b10111100101001111011110111111101),
.kernel_01(32'b00111101110011100011001100000000),
.kernel_02(32'b00111101101100010011001000101000),
.kernel_03(32'b00111101101110100011101101011000),
.kernel_04(32'b00111110001011111000010001110000),
.kernel_05(32'b10111101011001000010101000000101),
.kernel_06(32'b10111100001101010101100110111100),
.kernel_07(32'b00111101101110011000101001001110),
.kernel_08(32'b00111100101100001111101111100001),
.pxl_out(pxl_out_740), .valid_out(valid_out_740) );

//Channel 741
conv_33 #(D, DATA_WIDTH) x741(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111101000000000100001001010001),
.kernel_01(32'b00111111010000111110111100111101),
.kernel_02(32'b00111100001010011001100011101011),
.kernel_03(32'b10111101010010000001010111011010),
.kernel_04(32'b10111101010111110000010001110011),
.kernel_05(32'b00111101000110010010100001110110),
.kernel_06(32'b00111101001101101111110011100010),
.kernel_07(32'b00111101110000010000100000101110),
.kernel_08(32'b00111101011001001011110110110011),
.pxl_out(pxl_out_741), .valid_out(valid_out_741) );

//Channel 742
conv_33 #(D, DATA_WIDTH) x742(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b10111100001010010110011111100101),
.kernel_01(32'b10111111000000110011111011001110),
.kernel_02(32'b10111110100001110100111011011000),
.kernel_03(32'b10111101010100000101101101011001),
.kernel_04(32'b10111101011010010110011010111000),
.kernel_05(32'b00111100100111010000000101100001),
.kernel_06(32'b10111101011000001011010010010100),
.kernel_07(32'b10111100010101100000000100010101),
.kernel_08(32'b00111100110101011011011111101011),
.pxl_out(pxl_out_742), .valid_out(valid_out_742) );

//Channel 743
conv_33 #(D, DATA_WIDTH) x743(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b00111100000010001100011010011101),
.kernel_01(32'b10111101001111111110010101011100),
.kernel_02(32'b00111100100110011111101001100010),
.kernel_03(32'b10111110000101000010000000010010),
.kernel_04(32'b10111101111011110100011011110011),
.kernel_05(32'b10111100001011010100110110111100),
.kernel_06(32'b10111101100110100111100001111111),
.kernel_07(32'b00111110000011000100101011100110),
.kernel_08(32'b00111101000110001010000011101010),
.pxl_out(pxl_out_743), .valid_out(valid_out_743) );

//Channel 744
conv_33 #(D, DATA_WIDTH) x744(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b10111101111010100111110011101011),
.kernel_01(32'b10111110100001110011010101101011),
.kernel_02(32'b00111101000001101011111101000001),
.kernel_03(32'b10111101111001101000011100100111),
.kernel_04(32'b10111101001001010001010010000000),
.kernel_05(32'b10111011100001101100001100000011),
.kernel_06(32'b10111100001010100111010111000101),
.kernel_07(32'b00111101100000100100000100100001),
.kernel_08(32'b10111101101010111000111000011111),
.pxl_out(pxl_out_744), .valid_out(valid_out_744) );

//Channel 745
conv_33 #(D, DATA_WIDTH) x745(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111101110011101110010011010011),
.kernel_01(32'b10111101011100100010000111001011),
.kernel_02(32'b00111101100011001100111101010110),
.kernel_03(32'b00111110000101011111001101001101),
.kernel_04(32'b00111101110010010100111011111011),
.kernel_05(32'b00111110110110100100100111100011),
.kernel_06(32'b00111101000001001000011011011100),
.kernel_07(32'b00111010100111000000100111110111),
.kernel_08(32'b10111100010101000100101101010000),
.pxl_out(pxl_out_745), .valid_out(valid_out_745) );

//Channel 746
conv_33 #(D, DATA_WIDTH) x746(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111101110010111111010000000100),
.kernel_01(32'b00111101101001001010001010111110),
.kernel_02(32'b10111101100110011101110110000010),
.kernel_03(32'b00111101101010100111101111011000),
.kernel_04(32'b00111101100100011110111010000110),
.kernel_05(32'b10111101000011111011000001010111),
.kernel_06(32'b00111101110011111101000101110001),
.kernel_07(32'b00111101010110001111011010010010),
.kernel_08(32'b00111101100011101100100000000111),
.pxl_out(pxl_out_746), .valid_out(valid_out_746) );

//Channel 747
conv_33 #(D, DATA_WIDTH) x747(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b00111101000110010011010101110101),
.kernel_01(32'b00111101110110000010001101101110),
.kernel_02(32'b10111101111010001100100011101010),
.kernel_03(32'b10111110010011010101111001010111),
.kernel_04(32'b00111101001110101111001111100100),
.kernel_05(32'b10111010100111011001101110101000),
.kernel_06(32'b00111110010100000101011010110110),
.kernel_07(32'b00111101010110111110101101100110),
.kernel_08(32'b10111101101100000110010111011000),
.pxl_out(pxl_out_747), .valid_out(valid_out_747) );

//Channel 748
conv_33 #(D, DATA_WIDTH) x748(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b10111101100101011010110101101001),
.kernel_01(32'b10111011100101001001000001111001),
.kernel_02(32'b00111110101100101111010100111011),
.kernel_03(32'b10111110010111110000100000000000),
.kernel_04(32'b00111100110101011011101011000010),
.kernel_05(32'b00111101010001111010000101111000),
.kernel_06(32'b10111101010001000000110110001101),
.kernel_07(32'b00111101101100110111110010101101),
.kernel_08(32'b00111101110001101111001001011011),
.pxl_out(pxl_out_748), .valid_out(valid_out_748) );

//Channel 749
conv_33 #(D, DATA_WIDTH) x749(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111110001011110000010111011110),
.kernel_01(32'b10111110100001010011100111100101),
.kernel_02(32'b00111110000111110110010000100111),
.kernel_03(32'b10111101101010011011001001101010),
.kernel_04(32'b10111101111000010011100100001110),
.kernel_05(32'b10111101101001100111110010010100),
.kernel_06(32'b00111100001001010110001000001000),
.kernel_07(32'b10111101000101000101100111000101),
.kernel_08(32'b10111101110101011001011010100000),
.pxl_out(pxl_out_749), .valid_out(valid_out_749) );

//Channel 750
conv_33 #(D, DATA_WIDTH) x750(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b10111101010001001000011011100100),
.kernel_01(32'b00111101101101110110110110011010),
.kernel_02(32'b10111101100001101101011010101101),
.kernel_03(32'b10111101101111001011110011000011),
.kernel_04(32'b00111101010101010110000011101110),
.kernel_05(32'b10111110110011100001110101000010),
.kernel_06(32'b00111100001011110011110011111100),
.kernel_07(32'b00111110010011100000101010101110),
.kernel_08(32'b00111110000000010100100010000011),
.pxl_out(pxl_out_750), .valid_out(valid_out_750) );

//Channel 751
conv_33 #(D, DATA_WIDTH) x751(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111101000110110011011100000101),
.kernel_01(32'b10111100110010111100010111001100),
.kernel_02(32'b10111101111011011100101110110011),
.kernel_03(32'b10111100101110101100001011110101),
.kernel_04(32'b10111101101111110111001100101000),
.kernel_05(32'b00111100110000000001000100000010),
.kernel_06(32'b10111101100111111001111110000000),
.kernel_07(32'b00111100101100101011010110011100),
.kernel_08(32'b10111100010101111111010011010010),
.pxl_out(pxl_out_751), .valid_out(valid_out_751) );

//Channel 752
conv_33 #(D, DATA_WIDTH) x752(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b00111100101111111011010011100010),
.kernel_01(32'b10111110000010000111111111101101),
.kernel_02(32'b00111100101100100001001001010001),
.kernel_03(32'b10111100101010111111000101110000),
.kernel_04(32'b00111100100011001100001001010001),
.kernel_05(32'b10111010100111010101101001001100),
.kernel_06(32'b00111101111111110111101110000001),
.kernel_07(32'b10111100000101011000110010111101),
.kernel_08(32'b10111100110100000010101100001010),
.pxl_out(pxl_out_752), .valid_out(valid_out_752) );

//Channel 753
conv_33 #(D, DATA_WIDTH) x753(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b00111101111010100110010011001011),
.kernel_01(32'b00111101111100000110000111000100),
.kernel_02(32'b00111100111100001110101001101010),
.kernel_03(32'b00111101000100101100011110010110),
.kernel_04(32'b00111100010000011110100101111000),
.kernel_05(32'b00111100101011010011111100100101),
.kernel_06(32'b10111101111000111110000011110101),
.kernel_07(32'b10111010011100010111111010000000),
.kernel_08(32'b00111100111101010001101101111001),
.pxl_out(pxl_out_753), .valid_out(valid_out_753) );

//Channel 754
conv_33 #(D, DATA_WIDTH) x754(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111100100000110101111000010001),
.kernel_01(32'b10111110000001001001001010001101),
.kernel_02(32'b00111101000011100110111110111010),
.kernel_03(32'b10111101000111100001010111101010),
.kernel_04(32'b10111110000010100101010001001101),
.kernel_05(32'b10111110000101000011101110000100),
.kernel_06(32'b10111100011000010111011011011011),
.kernel_07(32'b10111110000101001110110001001010),
.kernel_08(32'b00111011010110100010001111000011),
.pxl_out(pxl_out_754), .valid_out(valid_out_754) );

//Channel 755
conv_33 #(D, DATA_WIDTH) x755(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111010110000000111000011011110),
.kernel_01(32'b10111100100000101101011010111111),
.kernel_02(32'b10111101100101101110101000111000),
.kernel_03(32'b00111101111110011001111010100100),
.kernel_04(32'b00111100000001110100100011010010),
.kernel_05(32'b10111101101011111110101001100100),
.kernel_06(32'b10111100111011101000111111100001),
.kernel_07(32'b00111100100100100101011111101100),
.kernel_08(32'b10111100101110111000100100000011),
.pxl_out(pxl_out_755), .valid_out(valid_out_755) );

//Channel 756
conv_33 #(D, DATA_WIDTH) x756(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111011111110000001100100110000),
.kernel_01(32'b10111100110101100100111000001101),
.kernel_02(32'b00111110000001010101011001101011),
.kernel_03(32'b00111101100111101111111000011011),
.kernel_04(32'b00111101011000100101111101111110),
.kernel_05(32'b00111101001000001010000111111010),
.kernel_06(32'b00111101001111101001111000101100),
.kernel_07(32'b10111100100000011100101001110001),
.kernel_08(32'b00111101001110110001111000000010),
.pxl_out(pxl_out_756), .valid_out(valid_out_756) );

//Channel 757
conv_33 #(D, DATA_WIDTH) x757(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111100011001011111000001100000),
.kernel_01(32'b10111100001000001100110001111111),
.kernel_02(32'b10111101011110101010100010000110),
.kernel_03(32'b10111011110110100001110100001101),
.kernel_04(32'b00111011110100011010111001011010),
.kernel_05(32'b00111101001010100111100000010100),
.kernel_06(32'b10111110011010110111001110110000),
.kernel_07(32'b00111010110111100111011000101010),
.kernel_08(32'b10111101000010110100000110110110),
.pxl_out(pxl_out_757), .valid_out(valid_out_757) );

//Channel 758
conv_33 #(D, DATA_WIDTH) x758(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111101100101100001100100000100),
.kernel_01(32'b10111101110010101101100010100101),
.kernel_02(32'b10111101100010110110100110000001),
.kernel_03(32'b00111110011000110100001100011011),
.kernel_04(32'b00111101010010101101100010010011),
.kernel_05(32'b10111110000001100101001101110111),
.kernel_06(32'b10111110011011110010011110010011),
.kernel_07(32'b00111100100110100010100111011111),
.kernel_08(32'b10111101001000101110111011110110),
.pxl_out(pxl_out_758), .valid_out(valid_out_758) );

//Channel 759
conv_33 #(D, DATA_WIDTH) x759(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b00111101000000001100011011011101),
.kernel_01(32'b00111100110100010000101101011011),
.kernel_02(32'b10111101001011111110011100111110),
.kernel_03(32'b10111101101001000000100000011001),
.kernel_04(32'b00111101000001011011010011110110),
.kernel_05(32'b00111101100000110000001111010001),
.kernel_06(32'b00111110011111000001110010010110),
.kernel_07(32'b10111110000101100101100111101110),
.kernel_08(32'b10111100111000001101011000110000),
.pxl_out(pxl_out_759), .valid_out(valid_out_759) );

//Channel 760
conv_33 #(D, DATA_WIDTH) x760(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b10111100001001111101001001011010),
.kernel_01(32'b10111011010111101111101010111110),
.kernel_02(32'b00111110100000100110111000011000),
.kernel_03(32'b00111100001010001111011110000000),
.kernel_04(32'b10111101000100100110100100111100),
.kernel_05(32'b00111101001011001100001100000111),
.kernel_06(32'b10111101100111111111100001011111),
.kernel_07(32'b00111101010010111010100111110101),
.kernel_08(32'b10111101011101101111011100001110),
.pxl_out(pxl_out_760), .valid_out(valid_out_760) );

//Channel 761
conv_33 #(D, DATA_WIDTH) x761(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111101110110100111000010110110),
.kernel_01(32'b10111101100000101100010110000011),
.kernel_02(32'b10111101001111110111101110010111),
.kernel_03(32'b10111101100111001000010011101010),
.kernel_04(32'b00111100111111110101101001010111),
.kernel_05(32'b10111101101011000101110101110101),
.kernel_06(32'b00111100101101010001100010001101),
.kernel_07(32'b00111100011110010100101100000000),
.kernel_08(32'b00111101110110011000000101000100),
.pxl_out(pxl_out_761), .valid_out(valid_out_761) );

//Channel 762
conv_33 #(D, DATA_WIDTH) x762(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b00111100101111100011000100110100),
.kernel_01(32'b00111100100101000101111110101001),
.kernel_02(32'b10111100011111101000001000011000),
.kernel_03(32'b00111100001011001110101011101011),
.kernel_04(32'b10111100110010100010011000000010),
.kernel_05(32'b10111101101000110010110000101000),
.kernel_06(32'b00111101100011110000110101101010),
.kernel_07(32'b00111101110000011101101111101110),
.kernel_08(32'b00111101000011101101111000110101),
.pxl_out(pxl_out_762), .valid_out(valid_out_762) );

//Channel 763
conv_33 #(D, DATA_WIDTH) x763(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111101101101111010110100011101),
.kernel_01(32'b10111100001101101101101111010100),
.kernel_02(32'b10111101001101100111111101111110),
.kernel_03(32'b10111110000011011110011110100101),
.kernel_04(32'b10111110100011110001110000011011),
.kernel_05(32'b10111101100101111001100011011011),
.kernel_06(32'b00111101000000010001000111100101),
.kernel_07(32'b10111101100100110001101101010010),
.kernel_08(32'b10111001101110011011011001010101),
.pxl_out(pxl_out_763), .valid_out(valid_out_763) );

//Channel 764
conv_33 #(D, DATA_WIDTH) x764(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111110010001101000010010011101),
.kernel_01(32'b10111101011100100110101010001001),
.kernel_02(32'b10111100100011000000011010000100),
.kernel_03(32'b00111100100010010010101101111011),
.kernel_04(32'b00111100110110101000111010011010),
.kernel_05(32'b10111100011001110000000101100011),
.kernel_06(32'b10111101010101010000001000110111),
.kernel_07(32'b00111110101010001011100100110101),
.kernel_08(32'b00111100100001000111000010110011),
.pxl_out(pxl_out_764), .valid_out(valid_out_764) );

//Channel 765
conv_33 #(D, DATA_WIDTH) x765(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111101000100001101111010110001),
.kernel_01(32'b00111101000111100110000111010100),
.kernel_02(32'b00111101100011010000101011011001),
.kernel_03(32'b10111110000001001110010101001111),
.kernel_04(32'b10111101111110000001101100110100),
.kernel_05(32'b10111110001011000000111101110111),
.kernel_06(32'b00111110000100100110111011001001),
.kernel_07(32'b00111101000110111100001101111010),
.kernel_08(32'b00111010011001010101011010110111),
.pxl_out(pxl_out_765), .valid_out(valid_out_765) );

//Channel 766
conv_33 #(D, DATA_WIDTH) x766(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b00111110000100111000001010101000),
.kernel_01(32'b10111101000110100110111001011011),
.kernel_02(32'b00111110010100101010010100110000),
.kernel_03(32'b10111101110100000001111010010011),
.kernel_04(32'b00111100001011000100001011110101),
.kernel_05(32'b10111101111111110110100000000110),
.kernel_06(32'b10111100101111011011100000001011),
.kernel_07(32'b00111100001111001100011011100101),
.kernel_08(32'b00111101000000010101101111010011),
.pxl_out(pxl_out_766), .valid_out(valid_out_766) );

//Channel 767
conv_33 #(D, DATA_WIDTH) x767(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b00111101110001110011111010000101),
.kernel_01(32'b10111101010110100110111010101001),
.kernel_02(32'b00111110000010100100110110110100),
.kernel_03(32'b00111101100011001100000110101100),
.kernel_04(32'b10111101110101111100101110000001),
.kernel_05(32'b00111110010101000100011010110101),
.kernel_06(32'b00111101010101001011001000101011),
.kernel_07(32'b00111101001111101101000100110001),
.kernel_08(32'b10111101010011011101011011111110),
.pxl_out(pxl_out_767), .valid_out(valid_out_767) );

//Channel 768
conv_33 #(D, DATA_WIDTH) x768(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b00111101110011111011010010111100),
.kernel_01(32'b00111101010101101000111101111111),
.kernel_02(32'b10111101111001110100011011100100),
.kernel_03(32'b00111101011110101111111011010000),
.kernel_04(32'b00111101010001010000110011111000),
.kernel_05(32'b00111100001011000011111000100110),
.kernel_06(32'b00111101010000111001000010100000),
.kernel_07(32'b10111100011110111001101000011010),
.kernel_08(32'b00111110010100000111011111010111),
.pxl_out(pxl_out_768), .valid_out(valid_out_768) );

//Channel 769
conv_33 #(D, DATA_WIDTH) x769(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111100111100101101110011101001),
.kernel_01(32'b10111101100011100001100010000011),
.kernel_02(32'b10111101000100011110111100000000),
.kernel_03(32'b00111101110000000101001101111110),
.kernel_04(32'b00111011110010111001110000100011),
.kernel_05(32'b00111100110111110110111010100010),
.kernel_06(32'b00111110010001001100000100101111),
.kernel_07(32'b00111101011011001100000100101010),
.kernel_08(32'b10111100100110011110011110101101),
.pxl_out(pxl_out_769), .valid_out(valid_out_769) );

//Channel 770
conv_33 #(D, DATA_WIDTH) x770(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111011011110101000101111011000),
.kernel_01(32'b00111101010101101111101001000111),
.kernel_02(32'b00111101111000111101111000101001),
.kernel_03(32'b00111110010011101001101111111101),
.kernel_04(32'b00111100001000111001011010001111),
.kernel_05(32'b00111100000110100010000100101101),
.kernel_06(32'b00111101010100000010010010101100),
.kernel_07(32'b10111101110011110100101110111101),
.kernel_08(32'b00111110110011111001100010110110),
.pxl_out(pxl_out_770), .valid_out(valid_out_770) );

//Channel 771
conv_33 #(D, DATA_WIDTH) x771(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111101000111110011011110000100),
.kernel_01(32'b10111100101110011000000011010011),
.kernel_02(32'b10111101100011111111111001000111),
.kernel_03(32'b10111101110001000101010110010000),
.kernel_04(32'b10111100110000110111000110000001),
.kernel_05(32'b10111100101011000011100000000000),
.kernel_06(32'b00111101100000010101100001000011),
.kernel_07(32'b00111011101111100001100100001011),
.kernel_08(32'b00111100110001101110010110001010),
.pxl_out(pxl_out_771), .valid_out(valid_out_771) );

//Channel 772
conv_33 #(D, DATA_WIDTH) x772(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111101010110110001011011111010),
.kernel_01(32'b00111101111000000100111011010010),
.kernel_02(32'b10111100011011001010110000100100),
.kernel_03(32'b10111101101111100111101011010100),
.kernel_04(32'b10111101010001111100110101010010),
.kernel_05(32'b10111110011111001111011111001110),
.kernel_06(32'b00111101001010011011101011000000),
.kernel_07(32'b00111110000010010100001001001010),
.kernel_08(32'b10111100101110010000100101100111),
.pxl_out(pxl_out_772), .valid_out(valid_out_772) );

//Channel 773
conv_33 #(D, DATA_WIDTH) x773(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111001100111000111001000111111),
.kernel_01(32'b10111100101010001001001101101001),
.kernel_02(32'b10111100111011010101100101000001),
.kernel_03(32'b10111110010001110000100001001001),
.kernel_04(32'b10111100110001110100010110000100),
.kernel_05(32'b10111101001001000000101110011110),
.kernel_06(32'b00111101011100101010011011000001),
.kernel_07(32'b00111101000100010101100010110111),
.kernel_08(32'b00111101101000000000001011100100),
.pxl_out(pxl_out_773), .valid_out(valid_out_773) );

//Channel 774
conv_33 #(D, DATA_WIDTH) x774(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111110100000000101111110111101),
.kernel_01(32'b00111111000011100111001001100101),
.kernel_02(32'b00111110100100111110011000111100),
.kernel_03(32'b00111101100111101100001110101110),
.kernel_04(32'b00111110100001000001010100001010),
.kernel_05(32'b10111101010001001000110000010001),
.kernel_06(32'b00111110000010101110111100000010),
.kernel_07(32'b00111100101011111000001000111110),
.kernel_08(32'b10111101100101101101100110000111),
.pxl_out(pxl_out_774), .valid_out(valid_out_774) );

//Channel 775
conv_33 #(D, DATA_WIDTH) x775(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b00111100101001010011000001101010),
.kernel_01(32'b10111010101000110001001111010101),
.kernel_02(32'b00111011011100011001000010010110),
.kernel_03(32'b00111110001000010101100011000110),
.kernel_04(32'b10111111000110000111111111011110),
.kernel_05(32'b10111100111100011001010110000010),
.kernel_06(32'b10111101110000000000110010010010),
.kernel_07(32'b00111110001010101101111110011001),
.kernel_08(32'b10111110101110110011101111010010),
.pxl_out(pxl_out_775), .valid_out(valid_out_775) );

//Channel 776
conv_33 #(D, DATA_WIDTH) x776(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b10111110000111000000111011011000),
.kernel_01(32'b10111111011010011001100000110000),
.kernel_02(32'b10111100100010001100100100111110),
.kernel_03(32'b00111110100000001010000001010101),
.kernel_04(32'b10111101101001000100010011010000),
.kernel_05(32'b00111101001001101000110111000100),
.kernel_06(32'b00111101000000010101000000011010),
.kernel_07(32'b10111101001000001110100110110001),
.kernel_08(32'b10111101100000100001110111010011),
.pxl_out(pxl_out_776), .valid_out(valid_out_776) );

//Channel 777
conv_33 #(D, DATA_WIDTH) x777(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111110010000111000100001110101),
.kernel_01(32'b00111100100101101110110000011011),
.kernel_02(32'b10111110001011001100101110110111),
.kernel_03(32'b00111101111100001000111000000111),
.kernel_04(32'b00111100001001110110011100011010),
.kernel_05(32'b00111111100010001011100110110101),
.kernel_06(32'b10111011110011011000010100111110),
.kernel_07(32'b10111101110110010110111000010000),
.kernel_08(32'b00111101000101100001000010110100),
.pxl_out(pxl_out_777), .valid_out(valid_out_777) );

//Channel 778
conv_33 #(D, DATA_WIDTH) x778(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111111001011010000001100110000),
.kernel_01(32'b10111101000110100101101010111100),
.kernel_02(32'b10111101101111100011110111010001),
.kernel_03(32'b00111101101010011111001000001101),
.kernel_04(32'b00111100111001100111000110100011),
.kernel_05(32'b10111100010011110101111001111101),
.kernel_06(32'b00111101101010100011110110111110),
.kernel_07(32'b00111101111010001010110101110010),
.kernel_08(32'b00111101101000110011010101111010),
.pxl_out(pxl_out_778), .valid_out(valid_out_778) );

//Channel 779
conv_33 #(D, DATA_WIDTH) x779(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111110010001111011110100010000),
.kernel_01(32'b00111110010000110001011001100000),
.kernel_02(32'b00111101011000011101011101111100),
.kernel_03(32'b10111101110110101011011010101000),
.kernel_04(32'b10111111010110011010000000100001),
.kernel_05(32'b00111100111111000100101100011111),
.kernel_06(32'b00111110111100011001000001011010),
.kernel_07(32'b00111100111001100011010000100011),
.kernel_08(32'b10111110010000001000011001111101),
.pxl_out(pxl_out_779), .valid_out(valid_out_779) );

//Channel 780
conv_33 #(D, DATA_WIDTH) x780(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b10111011101110001010001101000000),
.kernel_01(32'b00111100101010001001001010010110),
.kernel_02(32'b00111101010011100011000100001011),
.kernel_03(32'b10111101111000011010011101010111),
.kernel_04(32'b00111101111110001111000000011111),
.kernel_05(32'b00111101101101111111110001110010),
.kernel_06(32'b10111101100100000000001011001110),
.kernel_07(32'b10111100010001001101110010000101),
.kernel_08(32'b10111101000011010101111010100011),
.pxl_out(pxl_out_780), .valid_out(valid_out_780) );

//Channel 781
conv_33 #(D, DATA_WIDTH) x781(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b10111101001111010001010111000010),
.kernel_01(32'b10111111000010111011111101010101),
.kernel_02(32'b00111110110000111100100111100000),
.kernel_03(32'b00111101010110101001101010110011),
.kernel_04(32'b10111110001001010100110010001110),
.kernel_05(32'b10111110110011111100010110100101),
.kernel_06(32'b10111100011010001100111011111110),
.kernel_07(32'b00111101100000000100101001010101),
.kernel_08(32'b10111101011110000010011100111101),
.pxl_out(pxl_out_781), .valid_out(valid_out_781) );

//Channel 782
conv_33 #(D, DATA_WIDTH) x782(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b10111100101001100111110100101110),
.kernel_01(32'b10111100011010111000101110111000),
.kernel_02(32'b10111101111010100101001111010100),
.kernel_03(32'b10111101101101110111100011010000),
.kernel_04(32'b00111101100010100010011000101111),
.kernel_05(32'b10111110101111000101011000010001),
.kernel_06(32'b10111101001001110111101010101000),
.kernel_07(32'b00111110010110110110100100111110),
.kernel_08(32'b00111110010000001010110101011100),
.pxl_out(pxl_out_782), .valid_out(valid_out_782) );

//Channel 783
conv_33 #(D, DATA_WIDTH) x783(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111110110000111011001111101010),
.kernel_01(32'b00111100001111001110001100001000),
.kernel_02(32'b10111101110101100010001100111001),
.kernel_03(32'b00111110000000111001101011010110),
.kernel_04(32'b10111110010000011101101010011100),
.kernel_05(32'b10111100101001010011100100000011),
.kernel_06(32'b10111010111011000001011110110110),
.kernel_07(32'b10111010111001000111000100110011),
.kernel_08(32'b00111101000000000011001100000110),
.pxl_out(pxl_out_783), .valid_out(valid_out_783) );

//Channel 784
conv_33 #(D, DATA_WIDTH) x784(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b00111101000010001110100100001110),
.kernel_01(32'b10111101000010111010000000000000),
.kernel_02(32'b10111110000110000001111011101000),
.kernel_03(32'b00111101110011010101100001001101),
.kernel_04(32'b00111110100110100101111011101000),
.kernel_05(32'b00111011111100000110010111100011),
.kernel_06(32'b00111110110010010100001111110101),
.kernel_07(32'b10111101011111001001101110001110),
.kernel_08(32'b00111100100011000010000001000100),
.pxl_out(pxl_out_784), .valid_out(valid_out_784) );

//Channel 785
conv_33 #(D, DATA_WIDTH) x785(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111011111111011111000011001101),
.kernel_01(32'b10111110100000110011011100001001),
.kernel_02(32'b00111110001000100111101001000110),
.kernel_03(32'b10111011111010001011001110111110),
.kernel_04(32'b00111011110000110010101100111000),
.kernel_05(32'b00111100100100111001100110011110),
.kernel_06(32'b10111101100100101110101000010001),
.kernel_07(32'b10111101101100110001010100111100),
.kernel_08(32'b10111101110011011011010001100101),
.pxl_out(pxl_out_785), .valid_out(valid_out_785) );

//Channel 786
conv_33 #(D, DATA_WIDTH) x786(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b00111101111111111110011000001001),
.kernel_01(32'b10111100101011011101101100001010),
.kernel_02(32'b10111101101011111101000100000001),
.kernel_03(32'b00111100100010111010010010100010),
.kernel_04(32'b10111101100001000010010010110100),
.kernel_05(32'b00111110011110001001111010001110),
.kernel_06(32'b00111101001101011110000010110100),
.kernel_07(32'b10111111000000011011011000111100),
.kernel_08(32'b00111011010110011101010101011110),
.pxl_out(pxl_out_786), .valid_out(valid_out_786) );

//Channel 787
conv_33 #(D, DATA_WIDTH) x787(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111110011101001110000011010110),
.kernel_01(32'b10111100110111011010001000110111),
.kernel_02(32'b00111100011111011010111100100010),
.kernel_03(32'b10111100101010000010100001111110),
.kernel_04(32'b10111100011000011001001011111000),
.kernel_05(32'b10111101100001101100000111111010),
.kernel_06(32'b10111101110010010110110011011111),
.kernel_07(32'b10111101000000111101011111000011),
.kernel_08(32'b00111101000011000001001001111001),
.pxl_out(pxl_out_787), .valid_out(valid_out_787) );

//Channel 788
conv_33 #(D, DATA_WIDTH) x788(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111101111110010011100100011101),
.kernel_01(32'b00111101101000101100101101100100),
.kernel_02(32'b00111111001100111110001100010001),
.kernel_03(32'b00111010101000001010110010100110),
.kernel_04(32'b10111100101001111100010101001010),
.kernel_05(32'b10111100110001001011000111111111),
.kernel_06(32'b00111111010100101000001100101100),
.kernel_07(32'b10111101000000110110100101010101),
.kernel_08(32'b00111101100111010000111100111110),
.pxl_out(pxl_out_788), .valid_out(valid_out_788) );

//Channel 789
conv_33 #(D, DATA_WIDTH) x789(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111110001011110100101110111010),
.kernel_01(32'b00111101100000110011111000000101),
.kernel_02(32'b10111101010011011010110010010110),
.kernel_03(32'b00111110000110101100101111010100),
.kernel_04(32'b00111101101110101110000000000111),
.kernel_05(32'b00111101000101111111000101101000),
.kernel_06(32'b10111101001111001100100100100111),
.kernel_07(32'b00111101100010111100001001111101),
.kernel_08(32'b10111110000101000010010100000000),
.pxl_out(pxl_out_789), .valid_out(valid_out_789) );

//Channel 790
conv_33 #(D, DATA_WIDTH) x790(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111100110111100001101110010110),
.kernel_01(32'b10111111010100100010011000011011),
.kernel_02(32'b10111101000001100001100110001010),
.kernel_03(32'b10111110000010100000101101100001),
.kernel_04(32'b10111101000000001011000011110011),
.kernel_05(32'b10111101000001101001011111011011),
.kernel_06(32'b00111100101011010111111010011110),
.kernel_07(32'b00111100101100010101101111001100),
.kernel_08(32'b10111100101101101010010101100001),
.pxl_out(pxl_out_790), .valid_out(valid_out_790) );

//Channel 791
conv_33 #(D, DATA_WIDTH) x791(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b00111110010010100000101000100001),
.kernel_01(32'b10111100110001110010001100101111),
.kernel_02(32'b10111101110111001010010100110000),
.kernel_03(32'b10111101101100111011110000000101),
.kernel_04(32'b10111110010011111100000011111011),
.kernel_05(32'b00111110010000101000110110011101),
.kernel_06(32'b00111101101001011110101001001100),
.kernel_07(32'b00111110100011100001101010000011),
.kernel_08(32'b00111100111011011111000110000101),
.pxl_out(pxl_out_791), .valid_out(valid_out_791) );

//Channel 792
conv_33 #(D, DATA_WIDTH) x792(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b10111101000101100110001001111011),
.kernel_01(32'b00111110001000110100001100101011),
.kernel_02(32'b00111110000000000010101001000110),
.kernel_03(32'b00111101111011101001000000010100),
.kernel_04(32'b00111101100011111110010100000000),
.kernel_05(32'b00111101101100101011101000010001),
.kernel_06(32'b10111101010011101101101111001001),
.kernel_07(32'b00111101100010010010110101011011),
.kernel_08(32'b00111101000001011100001000000110),
.pxl_out(pxl_out_792), .valid_out(valid_out_792) );

//Channel 793
conv_33 #(D, DATA_WIDTH) x793(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111101001100110011101001101111),
.kernel_01(32'b00111110000000011100000101001010),
.kernel_02(32'b00111011011010001011111101110111),
.kernel_03(32'b10111100111101110110110011100000),
.kernel_04(32'b00111100111111110001111110011110),
.kernel_05(32'b00111100011111110111010001010000),
.kernel_06(32'b10111110000110111011110111000101),
.kernel_07(32'b00111101110011010000011110011111),
.kernel_08(32'b00111110011101001000000101111000),
.pxl_out(pxl_out_793), .valid_out(valid_out_793) );

//Channel 794
conv_33 #(D, DATA_WIDTH) x794(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111100100000000010101001000010),
.kernel_01(32'b10111101011011000101010110001110),
.kernel_02(32'b10111101001111100111011011110001),
.kernel_03(32'b00111100101000101000000101101000),
.kernel_04(32'b00111101010000001111100000101111),
.kernel_05(32'b10111101111101101010110110111001),
.kernel_06(32'b10111110000110100111111010001001),
.kernel_07(32'b00111110000111000011100010100001),
.kernel_08(32'b00111101000000001110000100001000),
.pxl_out(pxl_out_794), .valid_out(valid_out_794) );

//Channel 795
conv_33 #(D, DATA_WIDTH) x795(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111110001100111001011000111101),
.kernel_01(32'b00111101001111101111101101100000),
.kernel_02(32'b10111100000110101111110110010010),
.kernel_03(32'b10111110100110100010000011010011),
.kernel_04(32'b10111110010111101011111101100010),
.kernel_05(32'b10111101011111100000100101101101),
.kernel_06(32'b10111101111001100001101111010000),
.kernel_07(32'b10111101111000110001100111010111),
.kernel_08(32'b00111101000100001010001011000111),
.pxl_out(pxl_out_795), .valid_out(valid_out_795) );

//Channel 796
conv_33 #(D, DATA_WIDTH) x796(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111101010010000001101000100111),
.kernel_01(32'b10111110000100000100100100010000),
.kernel_02(32'b10111110001100010100110001101111),
.kernel_03(32'b00111101101011011111110111100101),
.kernel_04(32'b10111110000110111010010000101110),
.kernel_05(32'b10111101110011100111100100100111),
.kernel_06(32'b10111101010111111100100100100001),
.kernel_07(32'b00111110011110011010011000100111),
.kernel_08(32'b10111101101101101001101000011001),
.pxl_out(pxl_out_796), .valid_out(valid_out_796) );

//Channel 797
conv_33 #(D, DATA_WIDTH) x797(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111110001100011000101100000000),
.kernel_01(32'b00111101000100100110011010000101),
.kernel_02(32'b00111110000001110100101011011011),
.kernel_03(32'b00111101001110100001101101101110),
.kernel_04(32'b10111100110011111001011011001010),
.kernel_05(32'b10111101101100110110000011000110),
.kernel_06(32'b10111101001000010011111110111010),
.kernel_07(32'b10111110000100001101000110001101),
.kernel_08(32'b00111110010110100011110100011100),
.pxl_out(pxl_out_797), .valid_out(valid_out_797) );

//Channel 798
conv_33 #(D, DATA_WIDTH) x798(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b00111100110111010011000010000110),
.kernel_01(32'b00111101010100110011111101000101),
.kernel_02(32'b00111100101010000011010010001000),
.kernel_03(32'b10111101011010111100011011101111),
.kernel_04(32'b00111011011110010111001010000111),
.kernel_05(32'b10111101000110011110101011010010),
.kernel_06(32'b00111011000100001011010000010111),
.kernel_07(32'b10111100011111100110101011010000),
.kernel_08(32'b00111100101101000010110111011111),
.pxl_out(pxl_out_798), .valid_out(valid_out_798) );

//Channel 799
conv_33 #(D, DATA_WIDTH) x799(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b00111100101001111110001101100010),
.kernel_01(32'b00111100111100001111111000000101),
.kernel_02(32'b10111011101100111100000010010100),
.kernel_03(32'b00111110000010000001100101101000),
.kernel_04(32'b00111101101000011011111110100111),
.kernel_05(32'b00111101110101111011111011110000),
.kernel_06(32'b00111101101011111110011101011000),
.kernel_07(32'b10111110001010010110001000100000),
.kernel_08(32'b00111101011101010000000110000110),
.pxl_out(pxl_out_799), .valid_out(valid_out_799) );

//Channel 800
conv_33 #(D, DATA_WIDTH) x800(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b00111100101010011010010100010011),
.kernel_01(32'b00111101010001001110111000000110),
.kernel_02(32'b10111011110000111111101110000000),
.kernel_03(32'b00111101101010001100101101010110),
.kernel_04(32'b10111101111000101101100100111011),
.kernel_05(32'b10111101101100101000101111010111),
.kernel_06(32'b10111101000101000010110001111100),
.kernel_07(32'b10111110000101110111011011100101),
.kernel_08(32'b00111101100111000100101001110010),
.pxl_out(pxl_out_800), .valid_out(valid_out_800) );

//Channel 801
conv_33 #(D, DATA_WIDTH) x801(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b10111100000100011000111100001111),
.kernel_01(32'b10111100100111011011010011011100),
.kernel_02(32'b00111100010110111010010000110101),
.kernel_03(32'b00111101110111001110110000011001),
.kernel_04(32'b00111101111001010101011110001001),
.kernel_05(32'b00111101001100001011110011111010),
.kernel_06(32'b10111100110101010000000000010110),
.kernel_07(32'b00111101100100000000100100111011),
.kernel_08(32'b10111100111011110010001111110100),
.pxl_out(pxl_out_801), .valid_out(valid_out_801) );

//Channel 802
conv_33 #(D, DATA_WIDTH) x802(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111011100010011101001000001000),
.kernel_01(32'b00111011110000001101100001100111),
.kernel_02(32'b10111100110000100100011001001101),
.kernel_03(32'b10111100000001100010011101110010),
.kernel_04(32'b10111101001000101111000110100110),
.kernel_05(32'b10111100101001010000100010111010),
.kernel_06(32'b00111011110111101101101010110000),
.kernel_07(32'b00111101000001100001111110111001),
.kernel_08(32'b00111110011111111011110001110101),
.pxl_out(pxl_out_802), .valid_out(valid_out_802) );

//Channel 803
conv_33 #(D, DATA_WIDTH) x803(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111100100010111011110110010010),
.kernel_01(32'b10111101011000101011110100010000),
.kernel_02(32'b00111110001011100101101010100110),
.kernel_03(32'b10111101000000110111010111001011),
.kernel_04(32'b00111100101101100011110011010111),
.kernel_05(32'b10111010000100011010000100110111),
.kernel_06(32'b00111101000110110101110011100110),
.kernel_07(32'b00111100110100010100111111000010),
.kernel_08(32'b00111011111100100100011100101101),
.pxl_out(pxl_out_803), .valid_out(valid_out_803) );

//Channel 804
conv_33 #(D, DATA_WIDTH) x804(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111100111011001110011011010011),
.kernel_01(32'b00111100100101101000101111100101),
.kernel_02(32'b10111100110100111110000111100101),
.kernel_03(32'b10111110011010001111000111101001),
.kernel_04(32'b00111011110101010001010100010010),
.kernel_05(32'b00111101001001110011001111100111),
.kernel_06(32'b10111011000001111100101010111100),
.kernel_07(32'b10111101001111101111100111111101),
.kernel_08(32'b00111101111101001100000010011101),
.pxl_out(pxl_out_804), .valid_out(valid_out_804) );

//Channel 805
conv_33 #(D, DATA_WIDTH) x805(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111011100111011100100101011011),
.kernel_01(32'b10111101010001011010000110001100),
.kernel_02(32'b00111101010101110000011111101010),
.kernel_03(32'b10111100010100000010101011110001),
.kernel_04(32'b00111101101011110100001111000110),
.kernel_05(32'b10111100110101101101110001100010),
.kernel_06(32'b10111101101111010110001010100000),
.kernel_07(32'b10111101001001111011100101111001),
.kernel_08(32'b00111110100110110111001100011011),
.pxl_out(pxl_out_805), .valid_out(valid_out_805) );

//Channel 806
conv_33 #(D, DATA_WIDTH) x806(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b10111100000001111010000001111000),
.kernel_01(32'b00111110000000110111001101000101),
.kernel_02(32'b10111100100111100001110000000101),
.kernel_03(32'b10111101011111000001100111001001),
.kernel_04(32'b10111110010001010011001111010111),
.kernel_05(32'b00111101101011111000110110101000),
.kernel_06(32'b10111101010001001010011110101001),
.kernel_07(32'b10111100111001100000101010011101),
.kernel_08(32'b00111100010010001011111011101011),
.pxl_out(pxl_out_806), .valid_out(valid_out_806) );

//Channel 807
conv_33 #(D, DATA_WIDTH) x807(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111101000011110001110000110100),
.kernel_01(32'b00111101110011011000001111011100),
.kernel_02(32'b10111100100000101001100000010000),
.kernel_03(32'b10111011011000001110011010011010),
.kernel_04(32'b10111101111000110010111011011010),
.kernel_05(32'b00111100101001001110101101000000),
.kernel_06(32'b00111101000110010000001000011110),
.kernel_07(32'b00111100101101101101101111100011),
.kernel_08(32'b00111110011011010010110101000000),
.pxl_out(pxl_out_807), .valid_out(valid_out_807) );

//Channel 808
conv_33 #(D, DATA_WIDTH) x808(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111101000000110010110111000110),
.kernel_01(32'b00111101111010110001010110001001),
.kernel_02(32'b00111100011110111110000111101110),
.kernel_03(32'b10111101100101011000011001111111),
.kernel_04(32'b00111101101110111000000100000100),
.kernel_05(32'b10111100101101010101001001110101),
.kernel_06(32'b10111101000101000101111011101111),
.kernel_07(32'b00111101011110111000010110011111),
.kernel_08(32'b00111101101111101000000110100101),
.pxl_out(pxl_out_808), .valid_out(valid_out_808) );

//Channel 809
conv_33 #(D, DATA_WIDTH) x809(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b00111101101100100010000001100110),
.kernel_01(32'b10111100100010001100101010100000),
.kernel_02(32'b10111101101001010010100110010010),
.kernel_03(32'b00111011111100011110100110011000),
.kernel_04(32'b00111101110100001110110001100100),
.kernel_05(32'b00111101100110100000011111000000),
.kernel_06(32'b00111101110110000010000111111000),
.kernel_07(32'b10111100100001101001111011010101),
.kernel_08(32'b10111100000001110100000000011001),
.pxl_out(pxl_out_809), .valid_out(valid_out_809) );

//Channel 810
conv_33 #(D, DATA_WIDTH) x810(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b10111110010010001101110100111100),
.kernel_01(32'b00111101000001000001100111110110),
.kernel_02(32'b00111101001111011110110001111110),
.kernel_03(32'b10111110001101001100001010001111),
.kernel_04(32'b10111100011000010010010011000100),
.kernel_05(32'b10111101000001000111010111111101),
.kernel_06(32'b10111011110000011010011110101011),
.kernel_07(32'b00111100111000001001001101111000),
.kernel_08(32'b00111101000010001100110110111110),
.pxl_out(pxl_out_810), .valid_out(valid_out_810) );

//Channel 811
conv_33 #(D, DATA_WIDTH) x811(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111110001000101100110100110100),
.kernel_01(32'b00111101000001110001001010010001),
.kernel_02(32'b00111110100011111111010101111111),
.kernel_03(32'b00111100001010011101101110000100),
.kernel_04(32'b00111110011001011011000110010011),
.kernel_05(32'b00111101110000100010001000101111),
.kernel_06(32'b00111101110001010111100110010101),
.kernel_07(32'b00111101011101110000011000010001),
.kernel_08(32'b00111100011110010001000101001010),
.pxl_out(pxl_out_811), .valid_out(valid_out_811) );

//Channel 812
conv_33 #(D, DATA_WIDTH) x812(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b10111101110111011000100100011111),
.kernel_01(32'b10111101000001010011110101010000),
.kernel_02(32'b10111101100100011011010101011001),
.kernel_03(32'b00111101110110111110010001011001),
.kernel_04(32'b10111100111101011100110111010011),
.kernel_05(32'b00111110000101111100001001010011),
.kernel_06(32'b10111110100111000010001010111011),
.kernel_07(32'b10111101111011100011111110000110),
.kernel_08(32'b10111101110101101001010111110000),
.pxl_out(pxl_out_812), .valid_out(valid_out_812) );

//Channel 813
conv_33 #(D, DATA_WIDTH) x813(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b10111101100101110011001000100110),
.kernel_01(32'b00111101011101001011011000100000),
.kernel_02(32'b00111101101011000101111011011101),
.kernel_03(32'b00111010111011111010110011100001),
.kernel_04(32'b00111101110100101110000111111101),
.kernel_05(32'b10111110000100101000111111110101),
.kernel_06(32'b10111110001001111010110010011001),
.kernel_07(32'b00111101100001011101101100000101),
.kernel_08(32'b10111101011110110010111001110110),
.pxl_out(pxl_out_813), .valid_out(valid_out_813) );

//Channel 814
conv_33 #(D, DATA_WIDTH) x814(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111101011100100101110001111110),
.kernel_01(32'b00111110011010001101001100110010),
.kernel_02(32'b00111101011101010110101110111011),
.kernel_03(32'b10111101100100110111011101101100),
.kernel_04(32'b00111101111000000100011011001111),
.kernel_05(32'b10111011110111100000010100110010),
.kernel_06(32'b10111110000100001010111101001110),
.kernel_07(32'b10111110101101101101111101111101),
.kernel_08(32'b00111100011011000010101010011110),
.pxl_out(pxl_out_814), .valid_out(valid_out_814) );

//Channel 815
conv_33 #(D, DATA_WIDTH) x815(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111110011001010010011111010100),
.kernel_01(32'b00111101101101111111001000011011),
.kernel_02(32'b10111101011000100010110101011010),
.kernel_03(32'b00111110000101110001101001111000),
.kernel_04(32'b00111110000101100111100000011010),
.kernel_05(32'b00111110010010000011000001110010),
.kernel_06(32'b10111011101101001100000101000001),
.kernel_07(32'b10111101010100110000110011010000),
.kernel_08(32'b00111101010011100100100111010100),
.pxl_out(pxl_out_815), .valid_out(valid_out_815) );

//Channel 816
conv_33 #(D, DATA_WIDTH) x816(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b00111100000010001001100110100001),
.kernel_01(32'b10111100111100110001110100111111),
.kernel_02(32'b00111100100111011000011010101110),
.kernel_03(32'b10111100000110101000001011001101),
.kernel_04(32'b00111101100000010110100111110110),
.kernel_05(32'b00111011100011000011001000111001),
.kernel_06(32'b00111100111011001011111111110101),
.kernel_07(32'b10111101011011011010010101101110),
.kernel_08(32'b10111101100000101010101110101001),
.pxl_out(pxl_out_816), .valid_out(valid_out_816) );

//Channel 817
conv_33 #(D, DATA_WIDTH) x817(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b00111110001011011010110111110110),
.kernel_01(32'b00111110000111101010110011000011),
.kernel_02(32'b10111101101100100100110000100000),
.kernel_03(32'b00111100110101111110100011111110),
.kernel_04(32'b00111100011110111100111001111100),
.kernel_05(32'b00111110001100110001110111010111),
.kernel_06(32'b10111101100011000111110110000000),
.kernel_07(32'b10111101100110011111110100101100),
.kernel_08(32'b10111011011001111111110100000011),
.pxl_out(pxl_out_817), .valid_out(valid_out_817) );

//Channel 818
conv_33 #(D, DATA_WIDTH) x818(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111101100001000011010010111000),
.kernel_01(32'b10111101011110011000100011010000),
.kernel_02(32'b00111100111101111101011110100010),
.kernel_03(32'b10111101000110010111001111100010),
.kernel_04(32'b00111011101011100101101101000101),
.kernel_05(32'b10111110100010011111010101101100),
.kernel_06(32'b00111100001100110100001000100011),
.kernel_07(32'b10111101100101110110001100000110),
.kernel_08(32'b10111100110101011111010111111101),
.pxl_out(pxl_out_818), .valid_out(valid_out_818) );

//Channel 819
conv_33 #(D, DATA_WIDTH) x819(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111101100010101101101110000010),
.kernel_01(32'b00111101100000000101101000011101),
.kernel_02(32'b00111100001100110110111101110100),
.kernel_03(32'b00111101100111100000110011111010),
.kernel_04(32'b10111101000101101010111111011110),
.kernel_05(32'b00111101111110101101110011101110),
.kernel_06(32'b00111100110010011001100101001100),
.kernel_07(32'b00111100000111000111110010000100),
.kernel_08(32'b00111101110110010010000110110010),
.pxl_out(pxl_out_819), .valid_out(valid_out_819) );

//Channel 820
conv_33 #(D, DATA_WIDTH) x820(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b10111101000000100111101101100001),
.kernel_01(32'b00111101101100101001011011010110),
.kernel_02(32'b10111101000001011011001100000011),
.kernel_03(32'b10111101100110111111111011000000),
.kernel_04(32'b10111011110011100000011110111000),
.kernel_05(32'b00111101011000111000110000011100),
.kernel_06(32'b10111101101011010001100110100100),
.kernel_07(32'b10111100000011010010100100110010),
.kernel_08(32'b10111101101010001110010000111010),
.pxl_out(pxl_out_820), .valid_out(valid_out_820) );

//Channel 821
conv_33 #(D, DATA_WIDTH) x821(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b10111101011110101100110101000011),
.kernel_01(32'b10111101100011010000101100011100),
.kernel_02(32'b00111101001000001010011101010010),
.kernel_03(32'b00111101100011001001001010110001),
.kernel_04(32'b10111100000010101111011101010010),
.kernel_05(32'b00111101110011111000000111010111),
.kernel_06(32'b10111101100011100110100010011000),
.kernel_07(32'b00111100010110111010000110111100),
.kernel_08(32'b10111101010000000011010010111000),
.pxl_out(pxl_out_821), .valid_out(valid_out_821) );

//Channel 822
conv_33 #(D, DATA_WIDTH) x822(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111101011100100110111100110001),
.kernel_01(32'b00111110010010010011000001001110),
.kernel_02(32'b00111101010111000011001011110111),
.kernel_03(32'b00111100110000000111110001010110),
.kernel_04(32'b00111101100000011011000000010010),
.kernel_05(32'b10111101101110001100101111110110),
.kernel_06(32'b10111101011000111001111111001100),
.kernel_07(32'b10111101101000101111001001101011),
.kernel_08(32'b00111101000010100001101010011101),
.pxl_out(pxl_out_822), .valid_out(valid_out_822) );

//Channel 823
conv_33 #(D, DATA_WIDTH) x823(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b00111101110001100111111010000001),
.kernel_01(32'b10111101110011110111011101101101),
.kernel_02(32'b10111101100101101011011001001011),
.kernel_03(32'b10111100101111011000010100000110),
.kernel_04(32'b10111110000011011101000011110110),
.kernel_05(32'b10111011101000101001111010111011),
.kernel_06(32'b00111100111101111110110111101110),
.kernel_07(32'b00111100111010101100100100110110),
.kernel_08(32'b00111101111101111011000111011000),
.pxl_out(pxl_out_823), .valid_out(valid_out_823) );

//Channel 824
conv_33 #(D, DATA_WIDTH) x824(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111101001111001110011110101000),
.kernel_01(32'b10111110010000010000110101100100),
.kernel_02(32'b10111101101110101111010001000000),
.kernel_03(32'b10111101011001010100110010101100),
.kernel_04(32'b10111100111111100011000011000010),
.kernel_05(32'b10111101001111010001110111111101),
.kernel_06(32'b10111101101001011001001110001111),
.kernel_07(32'b00111100110111010011011101111100),
.kernel_08(32'b10111011110100101100000100000101),
.pxl_out(pxl_out_824), .valid_out(valid_out_824) );

//Channel 825
conv_33 #(D, DATA_WIDTH) x825(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111110000111010111101010010101),
.kernel_01(32'b10111101010100001110100111011101),
.kernel_02(32'b00111100111000111101010110011010),
.kernel_03(32'b00111101010100010111001010011010),
.kernel_04(32'b00111100100101000100110010011001),
.kernel_05(32'b10111101110010101100111101110000),
.kernel_06(32'b00111100100101011100000000101110),
.kernel_07(32'b10111110000100110101100101110100),
.kernel_08(32'b10111011110110001011100101001000),
.pxl_out(pxl_out_825), .valid_out(valid_out_825) );

//Channel 826
conv_33 #(D, DATA_WIDTH) x826(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111100000101110100110101101101),
.kernel_01(32'b00111101011000010111011000100101),
.kernel_02(32'b00111101100100100001001000000111),
.kernel_03(32'b10111101010001010101100010000001),
.kernel_04(32'b00111110000001110101010001110011),
.kernel_05(32'b00111101001010001001001001001000),
.kernel_06(32'b00111101001011010000111101000000),
.kernel_07(32'b10111101110110110101000010011110),
.kernel_08(32'b10111100110111001110111100011110),
.pxl_out(pxl_out_826), .valid_out(valid_out_826) );

//Channel 827
conv_33 #(D, DATA_WIDTH) x827(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b10111101011111001011101001010010),
.kernel_01(32'b10111101000000110001100110001100),
.kernel_02(32'b10111010001111011011011000111111),
.kernel_03(32'b10111101000010110101010101010010),
.kernel_04(32'b10111110000100111100010101011110),
.kernel_05(32'b10111100010101110011111101010100),
.kernel_06(32'b10111101010011110011111011001101),
.kernel_07(32'b00111110001100101100000000111000),
.kernel_08(32'b00111100011000101000001011101100),
.pxl_out(pxl_out_827), .valid_out(valid_out_827) );

//Channel 828
conv_33 #(D, DATA_WIDTH) x828(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b10111100110010111010001100011010),
.kernel_01(32'b00111100110110010001011110101001),
.kernel_02(32'b00111100111100101110000000110110),
.kernel_03(32'b10111101000100010110011111010110),
.kernel_04(32'b00111101100100001000100000101111),
.kernel_05(32'b00111101000111100000111001110011),
.kernel_06(32'b00111100101000111100101110100111),
.kernel_07(32'b00111101110000000111000110010101),
.kernel_08(32'b10111010100100101010110110000100),
.pxl_out(pxl_out_828), .valid_out(valid_out_828) );

//Channel 829
conv_33 #(D, DATA_WIDTH) x829(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b10111100100001101101001101010100),
.kernel_01(32'b10111101010000101010011010100000),
.kernel_02(32'b10111110010010011010010011000000),
.kernel_03(32'b10111101001001010101101001011010),
.kernel_04(32'b00111101000001001001101111111010),
.kernel_05(32'b10111110101101011010001100000010),
.kernel_06(32'b10111110010101011100110001111000),
.kernel_07(32'b10111111010000000100001001101010),
.kernel_08(32'b00111101011000111011101011010000),
.pxl_out(pxl_out_829), .valid_out(valid_out_829) );

//Channel 830
conv_33 #(D, DATA_WIDTH) x830(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111101100111001001100101110100),
.kernel_01(32'b10111101100100101000000001001000),
.kernel_02(32'b00111110000110100111011000000010),
.kernel_03(32'b10111110010111101110001100000000),
.kernel_04(32'b00111011011011001111011101000000),
.kernel_05(32'b10111110011010011111110110000111),
.kernel_06(32'b10111101011001111011001001010111),
.kernel_07(32'b10111101100111111110000001010111),
.kernel_08(32'b10111101100001010110000010001010),
.pxl_out(pxl_out_830), .valid_out(valid_out_830) );

//Channel 831
conv_33 #(D, DATA_WIDTH) x831(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111101111010100110010000100010),
.kernel_01(32'b10111010100010100110011110100101),
.kernel_02(32'b10111110010100101100011010101011),
.kernel_03(32'b10111110101110011100000101100000),
.kernel_04(32'b00111100001111101111110101001010),
.kernel_05(32'b00111110010001011111111000000111),
.kernel_06(32'b00111101111001101001100111110110),
.kernel_07(32'b10111110100001111000010101010101),
.kernel_08(32'b00111110011110001101010100000110),
.pxl_out(pxl_out_831), .valid_out(valid_out_831) );

//Channel 832
conv_33 #(D, DATA_WIDTH) x832(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b00111110000000000010110111010111),
.kernel_01(32'b00111110000100100001000110111010),
.kernel_02(32'b10111101001001101100110111010011),
.kernel_03(32'b00111101100101001110010101011010),
.kernel_04(32'b10111101110000100000111100010010),
.kernel_05(32'b00111101111101100011111101100110),
.kernel_06(32'b00111101101000010110101011110111),
.kernel_07(32'b00111101010101110000011110100100),
.kernel_08(32'b00111101010110010110100111100100),
.pxl_out(pxl_out_832), .valid_out(valid_out_832) );

//Channel 833
conv_33 #(D, DATA_WIDTH) x833(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111100000101000000001001000110),
.kernel_01(32'b10111011100101010010011110110011),
.kernel_02(32'b10111100100110001010101001011111),
.kernel_03(32'b00111110000001111101001101000011),
.kernel_04(32'b10111011000010001010001110100100),
.kernel_05(32'b00111011011001101110000100110001),
.kernel_06(32'b00111110001010001011000010101010),
.kernel_07(32'b00111101100010010101110110110011),
.kernel_08(32'b00111101100011011010001111100100),
.pxl_out(pxl_out_833), .valid_out(valid_out_833) );

//Channel 834
conv_33 #(D, DATA_WIDTH) x834(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111100100001101010001000100101),
.kernel_01(32'b10111101110001001001101110001111),
.kernel_02(32'b00111101001010100000111000111110),
.kernel_03(32'b00111110000001001000101000001111),
.kernel_04(32'b10111100110111001111101001001001),
.kernel_05(32'b00111101100010001010001100101000),
.kernel_06(32'b10111011111011000101000111000111),
.kernel_07(32'b00111101010000100011010111000101),
.kernel_08(32'b10111110010111010100111010000010),
.pxl_out(pxl_out_834), .valid_out(valid_out_834) );

//Channel 835
conv_33 #(D, DATA_WIDTH) x835(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111101000010010010101001100000),
.kernel_01(32'b00111101100100101010111000001010),
.kernel_02(32'b10111101100000101111011000100000),
.kernel_03(32'b00111100011001111011010010000111),
.kernel_04(32'b10111101001011010110010101111101),
.kernel_05(32'b00111101110110100000100101000011),
.kernel_06(32'b00111011000011101110000011110010),
.kernel_07(32'b00111101011110000111000011110111),
.kernel_08(32'b10111100111000110010101100111100),
.pxl_out(pxl_out_835), .valid_out(valid_out_835) );

//Channel 836
conv_33 #(D, DATA_WIDTH) x836(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b10111101110001001001111100010100),
.kernel_01(32'b10111110000101001111010100100000),
.kernel_02(32'b10111100011011010000111011111111),
.kernel_03(32'b00111110100000000111010000101111),
.kernel_04(32'b10111101011101111100011011100101),
.kernel_05(32'b10111010100001000100001000111001),
.kernel_06(32'b00111101000101001010000111100001),
.kernel_07(32'b00111101001110010110100011001101),
.kernel_08(32'b10111101100010011110111000010100),
.pxl_out(pxl_out_836), .valid_out(valid_out_836) );

//Channel 837
conv_33 #(D, DATA_WIDTH) x837(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b10111010101011100110100110101110),
.kernel_01(32'b00111111000100011010000110111101),
.kernel_02(32'b10111100100101001101010101111111),
.kernel_03(32'b10111101101101101010100101011010),
.kernel_04(32'b10111101110101010001111011111000),
.kernel_05(32'b00111100110001010111100001100101),
.kernel_06(32'b10111011001101100001000111010110),
.kernel_07(32'b00111110001001110100110001010011),
.kernel_08(32'b10111100110100100101101001011000),
.pxl_out(pxl_out_837), .valid_out(valid_out_837) );

//Channel 838
conv_33 #(D, DATA_WIDTH) x838(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b10111011100001110111010001100010),
.kernel_01(32'b00111110101011010001111010101001),
.kernel_02(32'b10111100111011111100111001110100),
.kernel_03(32'b00111101101101001001001000111101),
.kernel_04(32'b00111101110010011001110100011011),
.kernel_05(32'b00111100101001000111011101110011),
.kernel_06(32'b10111101100000110000010001001011),
.kernel_07(32'b00111101101000001110000010001000),
.kernel_08(32'b10111101000010010001000100011101),
.pxl_out(pxl_out_838), .valid_out(valid_out_838) );

//Channel 839
conv_33 #(D, DATA_WIDTH) x839(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b00111010110100100100001000001100),
.kernel_01(32'b00111100111101010010001111111000),
.kernel_02(32'b10111100111011100100100101110101),
.kernel_03(32'b10111110110001011111001010010101),
.kernel_04(32'b10111111010101010100111111110100),
.kernel_05(32'b00111100110000011100001001011000),
.kernel_06(32'b00111101111000010011011101001011),
.kernel_07(32'b00111101100000101001000101000111),
.kernel_08(32'b10111101100011111111010111100111),
.pxl_out(pxl_out_839), .valid_out(valid_out_839) );

//Channel 840
conv_33 #(D, DATA_WIDTH) x840(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b10111110111000111110011010100001),
.kernel_01(32'b10111110000111110110111011111001),
.kernel_02(32'b10111101111011000110010000110101),
.kernel_03(32'b00111101000110100111010101100000),
.kernel_04(32'b00111101101001100111000111000111),
.kernel_05(32'b00111100000110001110000010000010),
.kernel_06(32'b00111101110111101001100110010000),
.kernel_07(32'b00111101001001110111101111011010),
.kernel_08(32'b00111101101011100000101010110100),
.pxl_out(pxl_out_840), .valid_out(valid_out_840) );

//Channel 841
conv_33 #(D, DATA_WIDTH) x841(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b00111100100011110101000101011010),
.kernel_01(32'b10111101001110001000000011010000),
.kernel_02(32'b10111101111111110010000111010010),
.kernel_03(32'b10111101101100110000000011011001),
.kernel_04(32'b10111100101101110001100100111000),
.kernel_05(32'b10111100100001100011011000001111),
.kernel_06(32'b10111100010100010110101111110100),
.kernel_07(32'b00111101000101001000010111111001),
.kernel_08(32'b00111100111101000010111101000110),
.pxl_out(pxl_out_841), .valid_out(valid_out_841) );

//Channel 842
conv_33 #(D, DATA_WIDTH) x842(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b10111110001011001000110100110010),
.kernel_01(32'b10111101110001101011010101000101),
.kernel_02(32'b00111100101110110101011011010010),
.kernel_03(32'b00111011101100111100111111010000),
.kernel_04(32'b10111110100101100010110010101001),
.kernel_05(32'b10111101110000110101011000001101),
.kernel_06(32'b00111101011010001011100110111010),
.kernel_07(32'b10111101011110010100011100110110),
.kernel_08(32'b10111101010100101110001000001101),
.pxl_out(pxl_out_842), .valid_out(valid_out_842) );

//Channel 843
conv_33 #(D, DATA_WIDTH) x843(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b00111101011101101011010110010001),
.kernel_01(32'b10111101100100011101010001110001),
.kernel_02(32'b10111110101101101011011100111101),
.kernel_03(32'b10111101011110100110001001001100),
.kernel_04(32'b00111101000110110110110000111000),
.kernel_05(32'b00111101101110010000100000000111),
.kernel_06(32'b10111101000010100111111100011010),
.kernel_07(32'b00111101111111100000111101100001),
.kernel_08(32'b00111011110011011010000011001010),
.pxl_out(pxl_out_843), .valid_out(valid_out_843) );

//Channel 844
conv_33 #(D, DATA_WIDTH) x844(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111111000000100010001000110011),
.kernel_01(32'b10111100111111010011011011100101),
.kernel_02(32'b00111100101110111111101110100010),
.kernel_03(32'b00111101010001111100011111100100),
.kernel_04(32'b10111101011010111000011110111111),
.kernel_05(32'b00111110100110101000010010111100),
.kernel_06(32'b10111101100001001000100110110100),
.kernel_07(32'b00111110000100001100000100111100),
.kernel_08(32'b10111101111001001011011010110111),
.pxl_out(pxl_out_844), .valid_out(valid_out_844) );

//Channel 845
conv_33 #(D, DATA_WIDTH) x845(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111101010001110100000011111000),
.kernel_01(32'b00111011111001101110100110100001),
.kernel_02(32'b00111100000011100000111100000111),
.kernel_03(32'b00111101001010000001111011111000),
.kernel_04(32'b00111110000001011000100101111101),
.kernel_05(32'b00111110001000111000101000101001),
.kernel_06(32'b00111101100010011101001111110101),
.kernel_07(32'b10111110001100100110101111111111),
.kernel_08(32'b10111110000110011000001110111100),
.pxl_out(pxl_out_845), .valid_out(valid_out_845) );

//Channel 846
conv_33 #(D, DATA_WIDTH) x846(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111110000111101010110011100010),
.kernel_01(32'b10111110101010000001101101101111),
.kernel_02(32'b10111110011011101111101100101000),
.kernel_03(32'b00111110001110100100101110001011),
.kernel_04(32'b00111100011001010101000000000000),
.kernel_05(32'b10111101101001000011110100001011),
.kernel_06(32'b10111100011001100100000100100101),
.kernel_07(32'b10111101100101101010101001101010),
.kernel_08(32'b00111011111000001101001111110100),
.pxl_out(pxl_out_846), .valid_out(valid_out_846) );

//Channel 847
conv_33 #(D, DATA_WIDTH) x847(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b10111110101100110110110110100110),
.kernel_01(32'b10111100101000010110001011110001),
.kernel_02(32'b10111100001010100101010100001111),
.kernel_03(32'b10111100101100101101010101011110),
.kernel_04(32'b10111100110101111001010011100011),
.kernel_05(32'b00111101000111000000110011100001),
.kernel_06(32'b00111100001101011000110000111000),
.kernel_07(32'b10111100100101100011010001101101),
.kernel_08(32'b00111101000101100101111110000111),
.pxl_out(pxl_out_847), .valid_out(valid_out_847) );

//Channel 848
conv_33 #(D, DATA_WIDTH) x848(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b00111100110010010001101110010011),
.kernel_01(32'b10111011111101010101111101100010),
.kernel_02(32'b10111101001000101101011101110101),
.kernel_03(32'b00111100011110100001011001100111),
.kernel_04(32'b00111011111011101011110010111101),
.kernel_05(32'b00111100011100000101101011011010),
.kernel_06(32'b10111010111101010111100001110100),
.kernel_07(32'b00111101010001011101110110110110),
.kernel_08(32'b00111011110001110010001000110110),
.pxl_out(pxl_out_848), .valid_out(valid_out_848) );

//Channel 849
conv_33 #(D, DATA_WIDTH) x849(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b00110111101101001100101010110010),
.kernel_01(32'b00111110001101110011100101100001),
.kernel_02(32'b00111100101110111101100110000011),
.kernel_03(32'b00111011010100110101110010010101),
.kernel_04(32'b00111100110101100001010010001100),
.kernel_05(32'b00111100101011010000111111100010),
.kernel_06(32'b10111100101010111110111010010001),
.kernel_07(32'b10111100011110100011111111111000),
.kernel_08(32'b00111101011101111001001100010011),
.pxl_out(pxl_out_849), .valid_out(valid_out_849) );

//Channel 850
conv_33 #(D, DATA_WIDTH) x850(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b10111011111100000110010011110101),
.kernel_01(32'b10111100010000011100001101010101),
.kernel_02(32'b00111100100100110101000010111101),
.kernel_03(32'b10111101000001001011001111001100),
.kernel_04(32'b10111100110010011001110011000000),
.kernel_05(32'b10111110010110001001110011011000),
.kernel_06(32'b00111100111010110111101001011110),
.kernel_07(32'b10111100010011100100101111110001),
.kernel_08(32'b00111100101100001000011010011111),
.pxl_out(pxl_out_850), .valid_out(valid_out_850) );

//Channel 851
conv_33 #(D, DATA_WIDTH) x851(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111101110110010010110011100010),
.kernel_01(32'b10111011011001000111111011011000),
.kernel_02(32'b00111100010110110101100000010110),
.kernel_03(32'b10111101100010011111010011111011),
.kernel_04(32'b10111100110100111101110000100011),
.kernel_05(32'b10111101101000100000010000100111),
.kernel_06(32'b00111101100000011010011010110100),
.kernel_07(32'b00111100000000101011101111011101),
.kernel_08(32'b10111101100001011110111000010111),
.pxl_out(pxl_out_851), .valid_out(valid_out_851) );

//Channel 852
conv_33 #(D, DATA_WIDTH) x852(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111100010111001110000111010010),
.kernel_01(32'b00111101000000010111010100101001),
.kernel_02(32'b00111100111100100000100101011111),
.kernel_03(32'b00111101110101011011000110011001),
.kernel_04(32'b10111110001001010010111001001101),
.kernel_05(32'b10111110001001000101000011010110),
.kernel_06(32'b10111110101100100011101110101010),
.kernel_07(32'b00111011101011100001110001001110),
.kernel_08(32'b10111100100101011000010100111000),
.pxl_out(pxl_out_852), .valid_out(valid_out_852) );

//Channel 853
conv_33 #(D, DATA_WIDTH) x853(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b10111110000001011110011101000011),
.kernel_01(32'b00111101001001110000001111010110),
.kernel_02(32'b00111100101101111100101010000100),
.kernel_03(32'b00111101100111000001011000110000),
.kernel_04(32'b10111101100010100010000010100110),
.kernel_05(32'b10111101111001000000101101010110),
.kernel_06(32'b10111101001010100110100000010000),
.kernel_07(32'b00111101001010100000110010010001),
.kernel_08(32'b00111110001111011011100111101110),
.pxl_out(pxl_out_853), .valid_out(valid_out_853) );

//Channel 854
conv_33 #(D, DATA_WIDTH) x854(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b00111101110100011010110111001011),
.kernel_01(32'b00111110101001000100011101100111),
.kernel_02(32'b00111110001011011101110111110011),
.kernel_03(32'b10111100100100000111111000011000),
.kernel_04(32'b10111100100100101111110110010001),
.kernel_05(32'b00111101010001100000111111010111),
.kernel_06(32'b10111101100011010001010011011110),
.kernel_07(32'b10111011010001010010001110110101),
.kernel_08(32'b00111111000110010110010011110100),
.pxl_out(pxl_out_854), .valid_out(valid_out_854) );

//Channel 855
conv_33 #(D, DATA_WIDTH) x855(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111011001101001100000011111001),
.kernel_01(32'b10111101100111001011100001111001),
.kernel_02(32'b10111101100100001110001100110011),
.kernel_03(32'b00111100000001110001100111000111),
.kernel_04(32'b00111001110100110010010101011110),
.kernel_05(32'b00111100110111111101011101101000),
.kernel_06(32'b10111100111010111001100011101111),
.kernel_07(32'b10111100011001110110111101100110),
.kernel_08(32'b00111101010001101110011011100001),
.pxl_out(pxl_out_855), .valid_out(valid_out_855) );

//Channel 856
conv_33 #(D, DATA_WIDTH) x856(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111101001111010000001100111010),
.kernel_01(32'b00111100111000011100000001101001),
.kernel_02(32'b00111101101001100101000000110100),
.kernel_03(32'b10111011111101100001110101011100),
.kernel_04(32'b00111101000101100111001011101101),
.kernel_05(32'b10111011001010011110100110000011),
.kernel_06(32'b10111101100111111101110011111001),
.kernel_07(32'b10111101000110001010011000001010),
.kernel_08(32'b10111011100100001101101001010111),
.pxl_out(pxl_out_856), .valid_out(valid_out_856) );

//Channel 857
conv_33 #(D, DATA_WIDTH) x857(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111100100010100011000010000010),
.kernel_01(32'b10111110100111011000110100011001),
.kernel_02(32'b10111111000101001001010110011101),
.kernel_03(32'b10111000110110010111101101111100),
.kernel_04(32'b00111101010010100000111001101011),
.kernel_05(32'b00111101101110101010100111110010),
.kernel_06(32'b10111011110111011110010101110001),
.kernel_07(32'b00111101100110110011111111010111),
.kernel_08(32'b10111101000001011110111101010111),
.pxl_out(pxl_out_857), .valid_out(valid_out_857) );

//Channel 858
conv_33 #(D, DATA_WIDTH) x858(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b00111101001110000011001000011100),
.kernel_01(32'b10111110000000000100110010111100),
.kernel_02(32'b10111110000001001100000100101010),
.kernel_03(32'b00111101000100000100010101110111),
.kernel_04(32'b00111100111101111100100000111101),
.kernel_05(32'b00111110000010100110110111101111),
.kernel_06(32'b10111101101010011001110100111001),
.kernel_07(32'b00111101100010111000110110101100),
.kernel_08(32'b10111101110100101110111011010111),
.pxl_out(pxl_out_858), .valid_out(valid_out_858) );

//Channel 859
conv_33 #(D, DATA_WIDTH) x859(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b10111101110011100110110100100110),
.kernel_01(32'b00111110101011111110101001100000),
.kernel_02(32'b00111011100101011010110001101111),
.kernel_03(32'b10111101010111010000110001010111),
.kernel_04(32'b10111101001101101011011111010101),
.kernel_05(32'b10111100100100011000110000010111),
.kernel_06(32'b00111101111011001010110111001011),
.kernel_07(32'b10111110000101100000000011101100),
.kernel_08(32'b00111110101011110000100011100110),
.pxl_out(pxl_out_859), .valid_out(valid_out_859) );

//Channel 860
conv_33 #(D, DATA_WIDTH) x860(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111100100100100010101110101100),
.kernel_01(32'b00111010101111010011110101111000),
.kernel_02(32'b10111110001100111010000100000101),
.kernel_03(32'b00111110011101111010111010010101),
.kernel_04(32'b00111101011001011000010100110101),
.kernel_05(32'b10111110000110010000000001111111),
.kernel_06(32'b00111101100001010001010001110010),
.kernel_07(32'b00111101011100100000110001100111),
.kernel_08(32'b10111110100111010100100111101000),
.pxl_out(pxl_out_860), .valid_out(valid_out_860) );

//Channel 861
conv_33 #(D, DATA_WIDTH) x861(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111110101000110010011000101110),
.kernel_01(32'b00111101000100110110111110111011),
.kernel_02(32'b00111100000100010010101011001101),
.kernel_03(32'b00111010111100100001000110011010),
.kernel_04(32'b10111100011001111000011100011101),
.kernel_05(32'b00111101000001010001010000111011),
.kernel_06(32'b10111101110101101111011100001101),
.kernel_07(32'b10111100100100001000110101110001),
.kernel_08(32'b10111011001000001011001011001110),
.pxl_out(pxl_out_861), .valid_out(valid_out_861) );

//Channel 862
conv_33 #(D, DATA_WIDTH) x862(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111101000100001100010110000110),
.kernel_01(32'b10111101010010011000100101001101),
.kernel_02(32'b10111100111101110000100011000010),
.kernel_03(32'b00111101011110111010100100110101),
.kernel_04(32'b00111100001110110010010010101101),
.kernel_05(32'b10111101010101011100000110101010),
.kernel_06(32'b00111101100001110001001011001010),
.kernel_07(32'b00111101000110011101001110111101),
.kernel_08(32'b00111101000001100110010001111001),
.pxl_out(pxl_out_862), .valid_out(valid_out_862) );

//Channel 863
conv_33 #(D, DATA_WIDTH) x863(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b00111111000010000011001110101001),
.kernel_01(32'b10111101111001000101010110101000),
.kernel_02(32'b10111101010100111101111110010100),
.kernel_03(32'b10111110110000111010111001100111),
.kernel_04(32'b10111100101000100000000001111111),
.kernel_05(32'b00111011001111111100001010111101),
.kernel_06(32'b10111101110111100000001111101111),
.kernel_07(32'b00111110000000000000001011100010),
.kernel_08(32'b00111100110111101101110110100000),
.pxl_out(pxl_out_863), .valid_out(valid_out_863) );

//Channel 864
conv_33 #(D, DATA_WIDTH) x864(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b00111110000011000110000100010010),
.kernel_01(32'b10111101101001000010011001000011),
.kernel_02(32'b10111101101101011101001000010100),
.kernel_03(32'b10111111000011011000000011101011),
.kernel_04(32'b00111101110111000001000110110101),
.kernel_05(32'b00111110011011110100111101010110),
.kernel_06(32'b00111110010010101111110000110111),
.kernel_07(32'b00111110101111110101111110001000),
.kernel_08(32'b10111100100111110101000100111110),
.pxl_out(pxl_out_864), .valid_out(valid_out_864) );

//Channel 865
conv_33 #(D, DATA_WIDTH) x865(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111100111001110111001110101110),
.kernel_01(32'b10111101000100111000101110110011),
.kernel_02(32'b10111100100000011001000010001111),
.kernel_03(32'b00111110001011001101100110011000),
.kernel_04(32'b10111100111111011010010101000111),
.kernel_05(32'b10111101100101010001101111101100),
.kernel_06(32'b00111100011010010100100011100100),
.kernel_07(32'b00111101000101110010001100010101),
.kernel_08(32'b10111101101101111110010001010000),
.pxl_out(pxl_out_865), .valid_out(valid_out_865) );

//Channel 866
conv_33 #(D, DATA_WIDTH) x866(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111101000100010011110110111000),
.kernel_01(32'b00111100111010100100110011111010),
.kernel_02(32'b00111100111000010011010101111110),
.kernel_03(32'b00111101001010000011100010011101),
.kernel_04(32'b10111100011110011111000100111011),
.kernel_05(32'b00111101001001100110011111101010),
.kernel_06(32'b10111101100111101011110110111111),
.kernel_07(32'b00111110000111100010110000111001),
.kernel_08(32'b00111110100110100111011001010111),
.pxl_out(pxl_out_866), .valid_out(valid_out_866) );

//Channel 867
conv_33 #(D, DATA_WIDTH) x867(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111101000011010111011001011100),
.kernel_01(32'b00111101000101111011100110101100),
.kernel_02(32'b00111101100101010000101111101101),
.kernel_03(32'b00111101000011000111001101011000),
.kernel_04(32'b10111101100101100111111000001101),
.kernel_05(32'b10111100000010101000000011110110),
.kernel_06(32'b00111101010011000000000010110010),
.kernel_07(32'b10111100000011100001010000011111),
.kernel_08(32'b10111101011111001100100101001100),
.pxl_out(pxl_out_867), .valid_out(valid_out_867) );

//Channel 868
conv_33 #(D, DATA_WIDTH) x868(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b10111100101001101101010101110001),
.kernel_01(32'b10111101001101010010001101001000),
.kernel_02(32'b10111101100101000010110011011010),
.kernel_03(32'b10111110100010010000101000110000),
.kernel_04(32'b00111100100101010101010000101000),
.kernel_05(32'b00111011000010111001101100000001),
.kernel_06(32'b10111101000100100100101010011110),
.kernel_07(32'b00111100000010000011010000100001),
.kernel_08(32'b10111101001000100110011011011111),
.pxl_out(pxl_out_868), .valid_out(valid_out_868) );

//Channel 869
conv_33 #(D, DATA_WIDTH) x869(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111110000101110001110011111000),
.kernel_01(32'b10111101011010000000010110100100),
.kernel_02(32'b00111101010110011100111111001011),
.kernel_03(32'b10111101101010001100001001101011),
.kernel_04(32'b10111100110000000111110110101011),
.kernel_05(32'b00111100000100000101011000100100),
.kernel_06(32'b10111100100010000010111110111001),
.kernel_07(32'b00111100111001100111110111100001),
.kernel_08(32'b00111100001001000001000100110010),
.pxl_out(pxl_out_869), .valid_out(valid_out_869) );

//Channel 870
conv_33 #(D, DATA_WIDTH) x870(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b10111010101000101111100001111011),
.kernel_01(32'b00111110001110110010111110001101),
.kernel_02(32'b00111101100011101110100000100101),
.kernel_03(32'b00111101101000000000111101100001),
.kernel_04(32'b00111110001001011010001011111011),
.kernel_05(32'b10111100101100000110011101000100),
.kernel_06(32'b00111110000011000010001101011001),
.kernel_07(32'b00111100111001011001101111100000),
.kernel_08(32'b00111100100000001011001101001011),
.pxl_out(pxl_out_870), .valid_out(valid_out_870) );

//Channel 871
conv_33 #(D, DATA_WIDTH) x871(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111101000001010100001101000001),
.kernel_01(32'b00111100001001001001010111010001),
.kernel_02(32'b10111011011110001111110000001101),
.kernel_03(32'b00111010100100110000000000000101),
.kernel_04(32'b10111110001101111000101110010011),
.kernel_05(32'b00111011100100100111001010100011),
.kernel_06(32'b10111101100000010110000100101110),
.kernel_07(32'b10111101000101000100010111100111),
.kernel_08(32'b10111110000110001010101100011010),
.pxl_out(pxl_out_871), .valid_out(valid_out_871) );

//Channel 872
conv_33 #(D, DATA_WIDTH) x872(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b10111101011000101010110110000000),
.kernel_01(32'b10111110001011110010100011111101),
.kernel_02(32'b00111110001111001011000100000000),
.kernel_03(32'b10111110000000010011111000001111),
.kernel_04(32'b00111110101110100101110001000010),
.kernel_05(32'b10111101000110010100100001101101),
.kernel_06(32'b00111101011111011110001011110101),
.kernel_07(32'b10111101101011110000010111000001),
.kernel_08(32'b10111101000110101010011100110100),
.pxl_out(pxl_out_872), .valid_out(valid_out_872) );

//Channel 873
conv_33 #(D, DATA_WIDTH) x873(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b00111101110001100100000010110010),
.kernel_01(32'b10111101110110010100011010010010),
.kernel_02(32'b00111110000000010011001001001110),
.kernel_03(32'b00111100101001001000000001000111),
.kernel_04(32'b10111101100100111001111110001101),
.kernel_05(32'b10111100000001001010101001110001),
.kernel_06(32'b00111101010110100010111010101100),
.kernel_07(32'b00111100100010110011111000011101),
.kernel_08(32'b00111101101101001110111111010101),
.pxl_out(pxl_out_873), .valid_out(valid_out_873) );

//Channel 874
conv_33 #(D, DATA_WIDTH) x874(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111111001000001111110010001011),
.kernel_01(32'b00111100001011001111101100100010),
.kernel_02(32'b10111101101000011100101011000000),
.kernel_03(32'b10111100100111111000101001101100),
.kernel_04(32'b00111110010000100000010110001000),
.kernel_05(32'b10111110001011000001001111010100),
.kernel_06(32'b10111101101001011111111000100010),
.kernel_07(32'b00111110110110010000001110011100),
.kernel_08(32'b10111100101111100100010010011111),
.pxl_out(pxl_out_874), .valid_out(valid_out_874) );

//Channel 875
conv_33 #(D, DATA_WIDTH) x875(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b00111100100011001011000111011111),
.kernel_01(32'b00111100101100011101111000110101),
.kernel_02(32'b10111110001000010101110000111001),
.kernel_03(32'b00111110010001100100000001010010),
.kernel_04(32'b10111111000110110111001001011100),
.kernel_05(32'b10111100100100101100111011001011),
.kernel_06(32'b00111101001101000000000110111111),
.kernel_07(32'b00111100111100100110011101111111),
.kernel_08(32'b00111101000001110100010101100011),
.pxl_out(pxl_out_875), .valid_out(valid_out_875) );

//Channel 876
conv_33 #(D, DATA_WIDTH) x876(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111011011101010011010010010101),
.kernel_01(32'b10111100011100111001111101110000),
.kernel_02(32'b00111110010010110101100011010111),
.kernel_03(32'b00111100101000010011100100110100),
.kernel_04(32'b00111110010000010010110001100000),
.kernel_05(32'b00111100000111011000010110110100),
.kernel_06(32'b00111100100111111100011110011101),
.kernel_07(32'b00111101000110010011100001110001),
.kernel_08(32'b10111010101000001001010000111001),
.pxl_out(pxl_out_876), .valid_out(valid_out_876) );

//Channel 877
conv_33 #(D, DATA_WIDTH) x877(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b10111011100011111000010011001100),
.kernel_01(32'b00111101001110110101000111101000),
.kernel_02(32'b10111110110011101001000011000111),
.kernel_03(32'b10111101100011110000010001100000),
.kernel_04(32'b10111100010111111010010000000001),
.kernel_05(32'b10111110010011100010110000110000),
.kernel_06(32'b10111011011110111110011001010111),
.kernel_07(32'b10111110001101101110100011011101),
.kernel_08(32'b10111101111100001001001110011100),
.pxl_out(pxl_out_877), .valid_out(valid_out_877) );

//Channel 878
conv_33 #(D, DATA_WIDTH) x878(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111100010101010000010101011101),
.kernel_01(32'b10111100100000010110110110111010),
.kernel_02(32'b00111101010100111010011010010010),
.kernel_03(32'b10111101001101010000101111000110),
.kernel_04(32'b10111101010011010101001100010101),
.kernel_05(32'b00111110001101001111100101111011),
.kernel_06(32'b00111011000011010000010000101111),
.kernel_07(32'b00111101100100111110101010011100),
.kernel_08(32'b00111100111101000110111000111100),
.pxl_out(pxl_out_878), .valid_out(valid_out_878) );

//Channel 879
conv_33 #(D, DATA_WIDTH) x879(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111110010001001011011101111101),
.kernel_01(32'b10111101111111101100111001111011),
.kernel_02(32'b00111110000000011110000010010100),
.kernel_03(32'b00111101011100011111011011001011),
.kernel_04(32'b10111100011101111010101100000110),
.kernel_05(32'b10111110100001100010100100000101),
.kernel_06(32'b00111100000001000011110111001101),
.kernel_07(32'b10111101110111111111110010001000),
.kernel_08(32'b10111110111011111110110000011110),
.pxl_out(pxl_out_879), .valid_out(valid_out_879) );

//Channel 880
conv_33 #(D, DATA_WIDTH) x880(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111110000101000110111100011001),
.kernel_01(32'b10111110001110011000000010100011),
.kernel_02(32'b00111110011001110101011001011011),
.kernel_03(32'b00111101001110000011101101110110),
.kernel_04(32'b10111100000011111111011010100110),
.kernel_05(32'b10111101110000100001111101001000),
.kernel_06(32'b10111101111011100100101101100101),
.kernel_07(32'b00111101001011101111101111100111),
.kernel_08(32'b10111101011010001101101001011101),
.pxl_out(pxl_out_880), .valid_out(valid_out_880) );

//Channel 881
conv_33 #(D, DATA_WIDTH) x881(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111110001001001011100010011111),
.kernel_01(32'b00111110011101010101010101110011),
.kernel_02(32'b00111110000110101000101110010110),
.kernel_03(32'b10111100111111011000100001111101),
.kernel_04(32'b00111110101100111111010111000101),
.kernel_05(32'b10111110000000111100011001001011),
.kernel_06(32'b00111110011000110011001000010101),
.kernel_07(32'b10111101111110010101001101111101),
.kernel_08(32'b00111010100011101011000001110010),
.pxl_out(pxl_out_881), .valid_out(valid_out_881) );

//Channel 882
conv_33 #(D, DATA_WIDTH) x882(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b00111110100110000100100111010001),
.kernel_01(32'b10111101110010111011100000010010),
.kernel_02(32'b10111101101100111001011111011100),
.kernel_03(32'b00111110110111111001100001011001),
.kernel_04(32'b10111101011101000011001100111101),
.kernel_05(32'b10111110011001110101011001110110),
.kernel_06(32'b10111101110101110111110011111010),
.kernel_07(32'b00111101010000011100001110001011),
.kernel_08(32'b10111100100001010000010111001101),
.pxl_out(pxl_out_882), .valid_out(valid_out_882) );

//Channel 883
conv_33 #(D, DATA_WIDTH) x883(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111110100011011001101010001100),
.kernel_01(32'b10111101101111000100001111101011),
.kernel_02(32'b00111100101011010110101100001011),
.kernel_03(32'b00111101100001111110000011101001),
.kernel_04(32'b10111101011101111011101000111100),
.kernel_05(32'b00111101010110011000100110011011),
.kernel_06(32'b00111101111001000000000111000101),
.kernel_07(32'b10111101101101101111001100001111),
.kernel_08(32'b10111101110111001110110010001100),
.pxl_out(pxl_out_883), .valid_out(valid_out_883) );

//Channel 884
conv_33 #(D, DATA_WIDTH) x884(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111100000010101011100110010111),
.kernel_01(32'b10111101110000010001101111001111),
.kernel_02(32'b00111101010110000000101000011011),
.kernel_03(32'b00111100010100111110101000101010),
.kernel_04(32'b10111101100010110010100010001010),
.kernel_05(32'b10111011110010111101111000011000),
.kernel_06(32'b00111110101010001010010001110001),
.kernel_07(32'b00111100110010110011101001101101),
.kernel_08(32'b10111101111101100110110101000011),
.pxl_out(pxl_out_884), .valid_out(valid_out_884) );

//Channel 885
conv_33 #(D, DATA_WIDTH) x885(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b10111101000100001110010011010111),
.kernel_01(32'b00111010000100011111110111011101),
.kernel_02(32'b00111101110111111011000000010000),
.kernel_03(32'b10111101010010000011100001110101),
.kernel_04(32'b00111110010101010000001111101000),
.kernel_05(32'b00111101010010010001110011110110),
.kernel_06(32'b00111100100101010110110101110010),
.kernel_07(32'b10111010011110011011010000111001),
.kernel_08(32'b10111110000010101011011101010001),
.pxl_out(pxl_out_885), .valid_out(valid_out_885) );

//Channel 886
conv_33 #(D, DATA_WIDTH) x886(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b00111101000011011010001100100101),
.kernel_01(32'b10111110110011011010010101111100),
.kernel_02(32'b10111100011110101111111001111101),
.kernel_03(32'b10111101000010011000010011010000),
.kernel_04(32'b00111011101011111101110011110110),
.kernel_05(32'b00111101010000010101010100010100),
.kernel_06(32'b10111110000110001111101000011010),
.kernel_07(32'b10111100100010111001110100101101),
.kernel_08(32'b10111110110111101010101010100110),
.pxl_out(pxl_out_886), .valid_out(valid_out_886) );

//Channel 887
conv_33 #(D, DATA_WIDTH) x887(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111101000011110000010111101000),
.kernel_01(32'b10111110111001010001110001001100),
.kernel_02(32'b10111101010101001000101110100100),
.kernel_03(32'b00111100110101101110000011010011),
.kernel_04(32'b10111101100001001001001101100000),
.kernel_05(32'b00111101110010111011000100100100),
.kernel_06(32'b00111101000010000000110000111001),
.kernel_07(32'b00111100100101111000010100010110),
.kernel_08(32'b00111111011011001000001110101111),
.pxl_out(pxl_out_887), .valid_out(valid_out_887) );

//Channel 888
conv_33 #(D, DATA_WIDTH) x888(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111110001010001100101111100100),
.kernel_01(32'b00111101110111101011101000110010),
.kernel_02(32'b00111110100110010110111111001011),
.kernel_03(32'b10111100101011100000001100111010),
.kernel_04(32'b00111110000101000011100101100111),
.kernel_05(32'b00111100010101101100100101011001),
.kernel_06(32'b10111101110000101001101100100011),
.kernel_07(32'b10111011111010001001100011101001),
.kernel_08(32'b00111100100010001001101100000010),
.pxl_out(pxl_out_888), .valid_out(valid_out_888) );

//Channel 889
conv_33 #(D, DATA_WIDTH) x889(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111100100111110000100111101011),
.kernel_01(32'b10111101101000101000001000111111),
.kernel_02(32'b10111110100100010011111000010010),
.kernel_03(32'b00111100010010111111001101111111),
.kernel_04(32'b10111101110011110010011101000000),
.kernel_05(32'b00111110011111111001100011000110),
.kernel_06(32'b10111110100110011111110111110101),
.kernel_07(32'b10111110110001101001000011110100),
.kernel_08(32'b10111110110010100010010001110100),
.pxl_out(pxl_out_889), .valid_out(valid_out_889) );

//Channel 890
conv_33 #(D, DATA_WIDTH) x890(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b00111010111000101100111011101100),
.kernel_01(32'b00111110100001000011000110111000),
.kernel_02(32'b10111101111000110111011110111000),
.kernel_03(32'b00111100111011000110001000011011),
.kernel_04(32'b00111101101010110001110001010001),
.kernel_05(32'b00111101110001100111111010100010),
.kernel_06(32'b10111101110010111100001011000000),
.kernel_07(32'b10111110000100010101100111001001),
.kernel_08(32'b10111110000100011100100111111001),
.pxl_out(pxl_out_890), .valid_out(valid_out_890) );

//Channel 891
conv_33 #(D, DATA_WIDTH) x891(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b10111101010100110011001110011011),
.kernel_01(32'b10111100100101101001001010000000),
.kernel_02(32'b10111101100000011110011010010000),
.kernel_03(32'b00111110001000100010010100000110),
.kernel_04(32'b00111101101010011100011110010101),
.kernel_05(32'b10111101001101111101100000100010),
.kernel_06(32'b00111110000101010110000101111101),
.kernel_07(32'b00111111011100001001110010101011),
.kernel_08(32'b10111100010011111000010000000100),
.pxl_out(pxl_out_891), .valid_out(valid_out_891) );

//Channel 892
conv_33 #(D, DATA_WIDTH) x892(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111101101110010101010000111111),
.kernel_01(32'b00111110000000110001000111011110),
.kernel_02(32'b10111100001100010111000100011101),
.kernel_03(32'b00111100000011010001101011000010),
.kernel_04(32'b00111110010101011110001111111110),
.kernel_05(32'b00111110000001111110000001000110),
.kernel_06(32'b00111100110011101000100011100011),
.kernel_07(32'b10111011111110101001100110100101),
.kernel_08(32'b00111101110101011000000110101111),
.pxl_out(pxl_out_892), .valid_out(valid_out_892) );

//Channel 893
conv_33 #(D, DATA_WIDTH) x893(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b10111110100111111110010000111100),
.kernel_01(32'b10111110000101001010100110100100),
.kernel_02(32'b10111111100000101101000011001110),
.kernel_03(32'b10111101010010001111011111101000),
.kernel_04(32'b00111101001100011111010101111010),
.kernel_05(32'b00111101000010001010011110000111),
.kernel_06(32'b10111110011111111101010100101001),
.kernel_07(32'b00111100111001011001101100101010),
.kernel_08(32'b10111100111100011101101111011111),
.pxl_out(pxl_out_893), .valid_out(valid_out_893) );

//Channel 894
conv_33 #(D, DATA_WIDTH) x894(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111110101010001000000000000111),
.kernel_01(32'b10111100100000100010111010110101),
.kernel_02(32'b10111110000111010101001001110110),
.kernel_03(32'b00111110000100011110110110011001),
.kernel_04(32'b00111100010110011100001000010111),
.kernel_05(32'b10111110001000000010000101011100),
.kernel_06(32'b00111101011111000011011110111000),
.kernel_07(32'b00111101000010011010010001110011),
.kernel_08(32'b00111101010000000101001111010100),
.pxl_out(pxl_out_894), .valid_out(valid_out_894) );

//Channel 895
conv_33 #(D, DATA_WIDTH) x895(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b00111111001011000111000001111001),
.kernel_01(32'b00111100100001100101001101111111),
.kernel_02(32'b10111110000000000010100001000110),
.kernel_03(32'b10111111010110000111100010011011),
.kernel_04(32'b10111011101000100001101010100010),
.kernel_05(32'b10111101100111101101000011110010),
.kernel_06(32'b10111110000101100100101101001000),
.kernel_07(32'b00111101110110111000111110111111),
.kernel_08(32'b00111101001011010101100101101110),
.pxl_out(pxl_out_895), .valid_out(valid_out_895) );

//Channel 896
conv_33 #(D, DATA_WIDTH) x896(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b00111101100101110011110101001111),
.kernel_01(32'b10111110000001111010101010101111),
.kernel_02(32'b10111101011001101011100000001110),
.kernel_03(32'b10111110100110010101000000110111),
.kernel_04(32'b00111101011101000111100000101101),
.kernel_05(32'b00111110010111101111111101010001),
.kernel_06(32'b00111110101000011010111011111110),
.kernel_07(32'b00111111010011101101111001100100),
.kernel_08(32'b10111110100100011011000001110000),
.pxl_out(pxl_out_896), .valid_out(valid_out_896) );

//Channel 897
conv_33 #(D, DATA_WIDTH) x897(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b10111110001111101100111001000011),
.kernel_01(32'b10111101101110110110100001010011),
.kernel_02(32'b10111101101010111111001001101111),
.kernel_03(32'b10111101110001001110110101101110),
.kernel_04(32'b00111100101011000110100010000110),
.kernel_05(32'b10111101000101000111100000100010),
.kernel_06(32'b00111110101100110010100011001111),
.kernel_07(32'b00111100100100100111101000011100),
.kernel_08(32'b10111101110011000011110010010010),
.pxl_out(pxl_out_897), .valid_out(valid_out_897) );

//Channel 898
conv_33 #(D, DATA_WIDTH) x898(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111110101100100011001100110000),
.kernel_01(32'b10111101110001000111000011011110),
.kernel_02(32'b00111110100010110011101011101111),
.kernel_03(32'b00111100111001111001110101010110),
.kernel_04(32'b10111101001100101111110001010000),
.kernel_05(32'b10111011010000101010001011010011),
.kernel_06(32'b10111110000100000110111001111111),
.kernel_07(32'b00111101101001111111001100100101),
.kernel_08(32'b00111110000100001011100111010001),
.pxl_out(pxl_out_898), .valid_out(valid_out_898) );

//Channel 899
conv_33 #(D, DATA_WIDTH) x899(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111110001101011010111101100100),
.kernel_01(32'b10111100011011100110000100001111),
.kernel_02(32'b00111101101000110010010011101000),
.kernel_03(32'b10111110011100100011010111000100),
.kernel_04(32'b00111110000110011100010011011010),
.kernel_05(32'b10111101100000111101001101011101),
.kernel_06(32'b10111101010011101011100100100010),
.kernel_07(32'b00111101000101111101111111110001),
.kernel_08(32'b00111101001100101011101101001010),
.pxl_out(pxl_out_899), .valid_out(valid_out_899) );

//Channel 900
conv_33 #(D, DATA_WIDTH) x900(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b10111110001011010010100001010110),
.kernel_01(32'b10111110000010110011100111101100),
.kernel_02(32'b00111110001110011111010001110110),
.kernel_03(32'b10111101010101110010101000110111),
.kernel_04(32'b10111101011110011101111010111101),
.kernel_05(32'b00111101111101101100110111111111),
.kernel_06(32'b10111101101011111111011011110110),
.kernel_07(32'b00111110010010011111010000110011),
.kernel_08(32'b00111100011001100101010111100111),
.pxl_out(pxl_out_900), .valid_out(valid_out_900) );

//Channel 901
conv_33 #(D, DATA_WIDTH) x901(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111100100111101100000011111000),
.kernel_01(32'b10111100101000001100101001111111),
.kernel_02(32'b10111101010111001010001011111111),
.kernel_03(32'b10111100100111000111101001111011),
.kernel_04(32'b10111110100001101110101011000000),
.kernel_05(32'b00111101100111111001010000100010),
.kernel_06(32'b00111101110110001001000011000011),
.kernel_07(32'b10111110000000110011001001101010),
.kernel_08(32'b00111100001101011010001011100111),
.pxl_out(pxl_out_901), .valid_out(valid_out_901) );

//Channel 902
conv_33 #(D, DATA_WIDTH) x902(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b10111110101010100111000110011101),
.kernel_01(32'b00111101011111000101101010110110),
.kernel_02(32'b10111010011100011101000010000110),
.kernel_03(32'b10111100001000110000100101011101),
.kernel_04(32'b00111111101000000010000000001111),
.kernel_05(32'b10111011011111001100001010000111),
.kernel_06(32'b00111101101011110001111011101110),
.kernel_07(32'b00111110101101101101101100011011),
.kernel_08(32'b10111110011011111001100001000101),
.pxl_out(pxl_out_902), .valid_out(valid_out_902) );

//Channel 903
conv_33 #(D, DATA_WIDTH) x903(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b10111100111010100101110011101000),
.kernel_01(32'b00111011100100001110111011010010),
.kernel_02(32'b00111110010100010110110010111111),
.kernel_03(32'b10111101001001101100111110100111),
.kernel_04(32'b00111101100100101100010111011110),
.kernel_05(32'b10111110010100001110110100101111),
.kernel_06(32'b00111101010100100110011000001000),
.kernel_07(32'b10111101101100010011011011101110),
.kernel_08(32'b10111111100100101011100010100001),
.pxl_out(pxl_out_903), .valid_out(valid_out_903) );

//Channel 904
conv_33 #(D, DATA_WIDTH) x904(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b10111100010110110111001011000011),
.kernel_01(32'b00111101010101010100100000000100),
.kernel_02(32'b10111101010100001000010001101101),
.kernel_03(32'b10111101111000001100011001011010),
.kernel_04(32'b00111101110110100011011101110110),
.kernel_05(32'b00111010111000110000000110001001),
.kernel_06(32'b10111010001000110110110000001010),
.kernel_07(32'b10111110000010010100110001101001),
.kernel_08(32'b00111100100001000010000100110011),
.pxl_out(pxl_out_904), .valid_out(valid_out_904) );

//Channel 905
conv_33 #(D, DATA_WIDTH) x905(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111101101110100000000110111110),
.kernel_01(32'b00111110000100100101100001010110),
.kernel_02(32'b10111011110001110101010100111000),
.kernel_03(32'b00111101100010101000001111011101),
.kernel_04(32'b00111101010000000111111000110110),
.kernel_05(32'b00111100110100011100110011110011),
.kernel_06(32'b10111101101111111101101010100110),
.kernel_07(32'b10111101101110000110110000001010),
.kernel_08(32'b10111101111110111110011001111111),
.pxl_out(pxl_out_905), .valid_out(valid_out_905) );

//Channel 906
conv_33 #(D, DATA_WIDTH) x906(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111110101000011001100101100011),
.kernel_01(32'b00111100000010110111100100101011),
.kernel_02(32'b10111101110001011010101111110101),
.kernel_03(32'b00111110000110100000001001111000),
.kernel_04(32'b10111010110000101011101011101101),
.kernel_05(32'b10111101010111001001110100001000),
.kernel_06(32'b00111100011100001010111000101101),
.kernel_07(32'b10111110000100101111100111111010),
.kernel_08(32'b10111100101100100010011000111001),
.pxl_out(pxl_out_906), .valid_out(valid_out_906) );

//Channel 907
conv_33 #(D, DATA_WIDTH) x907(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b00111100011010110110110110110100),
.kernel_01(32'b00111110000011101111110010111100),
.kernel_02(32'b00111110100110110101100111011100),
.kernel_03(32'b00111101100101101011010100111100),
.kernel_04(32'b10111101110001100000110110100110),
.kernel_05(32'b00111011110000000000010100010000),
.kernel_06(32'b00111101010001001011001101111000),
.kernel_07(32'b00111101101000011111011110100010),
.kernel_08(32'b10111101010101110100100001100110),
.pxl_out(pxl_out_907), .valid_out(valid_out_907) );

//Channel 908
conv_33 #(D, DATA_WIDTH) x908(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111100110010011001001110101100),
.kernel_01(32'b00111101000001101010000111011110),
.kernel_02(32'b00111110100000010011011011001101),
.kernel_03(32'b10111101110001100110010100111010),
.kernel_04(32'b00111101100010001111000011111000),
.kernel_05(32'b00111101100001000110011101101101),
.kernel_06(32'b10111101001110110010001110100011),
.kernel_07(32'b10111101011101001111000111101101),
.kernel_08(32'b00111101110011110101000001001110),
.pxl_out(pxl_out_908), .valid_out(valid_out_908) );

//Channel 909
conv_33 #(D, DATA_WIDTH) x909(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111100100111100110001100010010),
.kernel_01(32'b00111101011110010001110010100010),
.kernel_02(32'b10111110111100111101110001110110),
.kernel_03(32'b10111110010011001101111010101101),
.kernel_04(32'b10111110100111000010010011101100),
.kernel_05(32'b10111111001001101111111010111000),
.kernel_06(32'b10111101000000001110100011111111),
.kernel_07(32'b10111101100001001100000111000000),
.kernel_08(32'b10111110000111011110000101001100),
.pxl_out(pxl_out_909), .valid_out(valid_out_909) );

//Channel 910
conv_33 #(D, DATA_WIDTH) x910(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111110000101001101001011111001),
.kernel_01(32'b00111101010010010100000101111010),
.kernel_02(32'b00111101110111000011000000010110),
.kernel_03(32'b10111110001100111001101010100111),
.kernel_04(32'b00111100101001001100111111101011),
.kernel_05(32'b00111101100100000111011111100010),
.kernel_06(32'b00111101101110111110101110101100),
.kernel_07(32'b00111110110100011011110110111100),
.kernel_08(32'b00111101110001010010001000000010),
.pxl_out(pxl_out_910), .valid_out(valid_out_910) );

//Channel 911
conv_33 #(D, DATA_WIDTH) x911(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b00111111000000100001000110100001),
.kernel_01(32'b00111101000101110110000000001110),
.kernel_02(32'b00111110010001011100111000000100),
.kernel_03(32'b10111101011111100000001011000010),
.kernel_04(32'b10111101001000010101100011110010),
.kernel_05(32'b10111101101101010000011000011010),
.kernel_06(32'b10111101101110000100100000110000),
.kernel_07(32'b10111101011001010011001010010110),
.kernel_08(32'b10111101000011110011100101011111),
.pxl_out(pxl_out_911), .valid_out(valid_out_911) );

//Channel 912
conv_33 #(D, DATA_WIDTH) x912(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b00111100110001000010011010010101),
.kernel_01(32'b10111101011111101010011010100010),
.kernel_02(32'b10111100111100111111100101000001),
.kernel_03(32'b00111011100001010100010110000101),
.kernel_04(32'b10111100100100000001010001010000),
.kernel_05(32'b10111100101001010010111011000111),
.kernel_06(32'b10111110001000011010000010111110),
.kernel_07(32'b10111011000111000111001010011100),
.kernel_08(32'b10111101001001011101101101000010),
.pxl_out(pxl_out_912), .valid_out(valid_out_912) );

//Channel 913
conv_33 #(D, DATA_WIDTH) x913(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b00111101000110001011100011010010),
.kernel_01(32'b00111101111111101001010110110010),
.kernel_02(32'b00111101001100110000001010011110),
.kernel_03(32'b00111101000011011101010010111111),
.kernel_04(32'b00111101111010110110111001111100),
.kernel_05(32'b00111110001001100100000010001110),
.kernel_06(32'b00111110000011101100100000001100),
.kernel_07(32'b00111101010110010100001011101010),
.kernel_08(32'b00111101101110110110110011101011),
.pxl_out(pxl_out_913), .valid_out(valid_out_913) );

//Channel 914
conv_33 #(D, DATA_WIDTH) x914(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b00111011101110100011100101111110),
.kernel_01(32'b10111101110110101110101101110111),
.kernel_02(32'b10111101100101010001110110010001),
.kernel_03(32'b00111101100000100111001000011001),
.kernel_04(32'b10111001100110111100000111100101),
.kernel_05(32'b10111110000011001011000010000100),
.kernel_06(32'b00111100011100101101000111111000),
.kernel_07(32'b00111101101111100011111111111110),
.kernel_08(32'b00111011100101000001110011000011),
.pxl_out(pxl_out_914), .valid_out(valid_out_914) );

//Channel 915
conv_33 #(D, DATA_WIDTH) x915(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111100001110010100010001001001),
.kernel_01(32'b00111101000110111010101100000111),
.kernel_02(32'b10111110001011100001000001110000),
.kernel_03(32'b00111101011101110110000100111110),
.kernel_04(32'b00111101110111111011000100111110),
.kernel_05(32'b00111101011100100001111010101110),
.kernel_06(32'b10111101010011101010101111010010),
.kernel_07(32'b00111101000110000101001010001100),
.kernel_08(32'b10111100100010111010011011000011),
.pxl_out(pxl_out_915), .valid_out(valid_out_915) );

//Channel 916
conv_33 #(D, DATA_WIDTH) x916(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111011111101111110001010110001),
.kernel_01(32'b10111011110111100011000001100110),
.kernel_02(32'b10111110001001100111111101101100),
.kernel_03(32'b10111100011100100101011001000011),
.kernel_04(32'b10111101001001010101000000010000),
.kernel_05(32'b00111011111000101001111110100001),
.kernel_06(32'b00111101110000100001010010111111),
.kernel_07(32'b00111100101011010011101011010011),
.kernel_08(32'b10111101100011010111010010111110),
.pxl_out(pxl_out_916), .valid_out(valid_out_916) );

//Channel 917
conv_33 #(D, DATA_WIDTH) x917(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111101101000001101100011100011),
.kernel_01(32'b10111101101111010000011111100100),
.kernel_02(32'b00111010100111100111101000101101),
.kernel_03(32'b00111100100011011100100110100000),
.kernel_04(32'b00111101011111100010100101110110),
.kernel_05(32'b00111011110110111011010001001101),
.kernel_06(32'b10111100101111000001101111010010),
.kernel_07(32'b00111100111100110100000000101111),
.kernel_08(32'b10111100111111100111011010100100),
.pxl_out(pxl_out_917), .valid_out(valid_out_917) );

//Channel 918
conv_33 #(D, DATA_WIDTH) x918(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111101000101111011110011101110),
.kernel_01(32'b10111110000110001011010010111000),
.kernel_02(32'b10111100001010100010100100101010),
.kernel_03(32'b10111101110011111011101111011110),
.kernel_04(32'b10111101011011011101000101011100),
.kernel_05(32'b10111100010001110011101101110000),
.kernel_06(32'b00111100101110100100011011000001),
.kernel_07(32'b10111100110000011001111001101010),
.kernel_08(32'b10111101001010001101110010001000),
.pxl_out(pxl_out_918), .valid_out(valid_out_918) );

//Channel 919
conv_33 #(D, DATA_WIDTH) x919(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b00111101101101000101000100111001),
.kernel_01(32'b10111011011111101100001111001000),
.kernel_02(32'b00111101110010101110011100000101),
.kernel_03(32'b00111100101100011100110011000000),
.kernel_04(32'b10111011101111011011010011100101),
.kernel_05(32'b10111101100111110000000001110110),
.kernel_06(32'b00111110101111111010110111000001),
.kernel_07(32'b00111101110101100100110000000011),
.kernel_08(32'b00111101110100110100110011001100),
.pxl_out(pxl_out_919), .valid_out(valid_out_919) );

//Channel 920
conv_33 #(D, DATA_WIDTH) x920(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111100101011111010010111111001),
.kernel_01(32'b00111101011101100100010001010010),
.kernel_02(32'b10111110000001111010100001010110),
.kernel_03(32'b00111101101001010101000011000010),
.kernel_04(32'b10111101100110111111001000101101),
.kernel_05(32'b10111101010000010101011000111110),
.kernel_06(32'b10111100110011000001100010110011),
.kernel_07(32'b00111011111111011010011100000011),
.kernel_08(32'b10111101100010010100001111011100),
.pxl_out(pxl_out_920), .valid_out(valid_out_920) );

//Channel 921
conv_33 #(D, DATA_WIDTH) x921(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111011110101001001000000100101),
.kernel_01(32'b10111100100000101111101100111110),
.kernel_02(32'b00111101001110010000110110010101),
.kernel_03(32'b10111101001111010110111111010010),
.kernel_04(32'b10111110011001001101010110101010),
.kernel_05(32'b10111100101100110111010101010110),
.kernel_06(32'b00111101110010100110111001101111),
.kernel_07(32'b00111101011100101001000011010000),
.kernel_08(32'b10111110100000101101100110010011),
.pxl_out(pxl_out_921), .valid_out(valid_out_921) );

//Channel 922
conv_33 #(D, DATA_WIDTH) x922(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111101010101110000101100101101),
.kernel_01(32'b10111101100100100100111101010000),
.kernel_02(32'b00111101101111010101101110100010),
.kernel_03(32'b10111100111100000010100011111111),
.kernel_04(32'b10111110000000000011001000001100),
.kernel_05(32'b00111101111010000111110001011110),
.kernel_06(32'b00111101110000101000001000001110),
.kernel_07(32'b00111101101001001111011100000011),
.kernel_08(32'b10111101000000010110001111000010),
.pxl_out(pxl_out_922), .valid_out(valid_out_922) );

//Channel 923
conv_33 #(D, DATA_WIDTH) x923(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b10111101010100100101010111001010),
.kernel_01(32'b10111100000000001111010001111101),
.kernel_02(32'b00111110011110100000011001101000),
.kernel_03(32'b00111110001000111011000011000101),
.kernel_04(32'b00111101101100110011110010110111),
.kernel_05(32'b10111100100011010100100110011110),
.kernel_06(32'b00111100100010011111111011101111),
.kernel_07(32'b10111110100010010101100100001111),
.kernel_08(32'b00111101110001011110010110000001),
.pxl_out(pxl_out_923), .valid_out(valid_out_923) );

//Channel 924
conv_33 #(D, DATA_WIDTH) x924(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111101101001100001111000001001),
.kernel_01(32'b10111110001001111001111000000000),
.kernel_02(32'b00111101000011000101111101100111),
.kernel_03(32'b10111100010110011111001101001101),
.kernel_04(32'b10111100111011001101011011010111),
.kernel_05(32'b00111101101110101110000001011111),
.kernel_06(32'b00111101100100010100010110011010),
.kernel_07(32'b10111101000100111011100100111111),
.kernel_08(32'b10111101000010111101011101110111),
.pxl_out(pxl_out_924), .valid_out(valid_out_924) );

//Channel 925
conv_33 #(D, DATA_WIDTH) x925(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b10111110010011101011011111110001),
.kernel_01(32'b10111100101100001011011010011011),
.kernel_02(32'b00111110100001110110011111111111),
.kernel_03(32'b00111101100001101111001001100000),
.kernel_04(32'b00111011101000100111000010100001),
.kernel_05(32'b10111010001100000001010000000011),
.kernel_06(32'b00111100100001111001001011101000),
.kernel_07(32'b00111110010001101001101010100101),
.kernel_08(32'b00111101000011100111001111010000),
.pxl_out(pxl_out_925), .valid_out(valid_out_925) );

//Channel 926
conv_33 #(D, DATA_WIDTH) x926(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111100100101000111100011111100),
.kernel_01(32'b10111100011001001100001011001110),
.kernel_02(32'b10111011101100010010001001110011),
.kernel_03(32'b10111101101101101101101110010111),
.kernel_04(32'b10111110010001100011001010010010),
.kernel_05(32'b10111110001001000001111011111101),
.kernel_06(32'b00111101000110100000111001101111),
.kernel_07(32'b10111101010011110101100101000001),
.kernel_08(32'b00111101000110001001000101111100),
.pxl_out(pxl_out_926), .valid_out(valid_out_926) );

//Channel 927
conv_33 #(D, DATA_WIDTH) x927(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111100100010110000111000110001),
.kernel_01(32'b00111101000101110101110001000001),
.kernel_02(32'b00111101001001001101100001000000),
.kernel_03(32'b00111110011100101001101110001100),
.kernel_04(32'b00111101011101100011010100000001),
.kernel_05(32'b00111101100010110111110101000011),
.kernel_06(32'b00111101101000100101100010111100),
.kernel_07(32'b00111100111111100111001011011011),
.kernel_08(32'b10111011100000110100110100111001),
.pxl_out(pxl_out_927), .valid_out(valid_out_927) );

//Channel 928
conv_33 #(D, DATA_WIDTH) x928(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b00111101001000011000100011000100),
.kernel_01(32'b00111101011011100110010110100101),
.kernel_02(32'b00111101001100101011011000101101),
.kernel_03(32'b00111101000010111111100001001001),
.kernel_04(32'b00111110001011111000101000100110),
.kernel_05(32'b00111101110111001001011000001001),
.kernel_06(32'b00111101110011110010000000001011),
.kernel_07(32'b10111110001001011010000000110101),
.kernel_08(32'b00111100110011001000011000111001),
.pxl_out(pxl_out_928), .valid_out(valid_out_928) );

//Channel 929
conv_33 #(D, DATA_WIDTH) x929(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b10111100011001010001101111100010),
.kernel_01(32'b00111101000000101000011011010011),
.kernel_02(32'b10111110010000101000110111111010),
.kernel_03(32'b00111101100101000100001110001101),
.kernel_04(32'b00111011101010001010011010111110),
.kernel_05(32'b00111101001100001110101010110000),
.kernel_06(32'b00111110000101011010011011101110),
.kernel_07(32'b00111011111001101100100010111010),
.kernel_08(32'b10111101101000000111000100110001),
.pxl_out(pxl_out_929), .valid_out(valid_out_929) );

//Channel 930
conv_33 #(D, DATA_WIDTH) x930(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b00111101011101100111111010010101),
.kernel_01(32'b00111101011111110011110001110011),
.kernel_02(32'b10111100011010110011101000010011),
.kernel_03(32'b00111101010111110111010101010101),
.kernel_04(32'b00111101001110011001101100000110),
.kernel_05(32'b00111011111011100000000111000101),
.kernel_06(32'b00111100001011101010000000100111),
.kernel_07(32'b00111100110111010000010100000110),
.kernel_08(32'b00111110010110011100101100011011),
.pxl_out(pxl_out_930), .valid_out(valid_out_930) );

//Channel 931
conv_33 #(D, DATA_WIDTH) x931(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111101000010111010011010001100),
.kernel_01(32'b00111011111011100011110011000001),
.kernel_02(32'b00111101011010000010011001111101),
.kernel_03(32'b10111110010011010010111110101011),
.kernel_04(32'b10111110000101111011011000000011),
.kernel_05(32'b00111100100111010001010000010010),
.kernel_06(32'b10111101011010110100011101110010),
.kernel_07(32'b00111101010111110001000101000001),
.kernel_08(32'b00111100000011110101000111100000),
.pxl_out(pxl_out_931), .valid_out(valid_out_931) );

//Channel 932
conv_33 #(D, DATA_WIDTH) x932(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111101000000000011111111111001),
.kernel_01(32'b00111110000110001010010000001010),
.kernel_02(32'b00111100100011111010101101010011),
.kernel_03(32'b10111110000011100100110110001011),
.kernel_04(32'b00111011110100110101000110010010),
.kernel_05(32'b10111110000101001000100101101011),
.kernel_06(32'b00111101100011011000001111101001),
.kernel_07(32'b10111101000000110000110011100010),
.kernel_08(32'b10111101100111110110101001000011),
.pxl_out(pxl_out_932), .valid_out(valid_out_932) );

//Channel 933
conv_33 #(D, DATA_WIDTH) x933(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b10111100001111001011001000100101),
.kernel_01(32'b10111000101010100100111101111011),
.kernel_02(32'b00111101110110011101000110001100),
.kernel_03(32'b00111101110110001001001101100101),
.kernel_04(32'b10111011011111101100110010110110),
.kernel_05(32'b10111100011101010000001110100010),
.kernel_06(32'b00111101011011000110001010111110),
.kernel_07(32'b00111101110100011101010111010010),
.kernel_08(32'b00111101100101010010011101101101),
.pxl_out(pxl_out_933), .valid_out(valid_out_933) );

//Channel 934
conv_33 #(D, DATA_WIDTH) x934(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111101110100010100101010110000),
.kernel_01(32'b00111101110010110111101110001111),
.kernel_02(32'b00111101000101000001010110110100),
.kernel_03(32'b00111101010001101110110010111100),
.kernel_04(32'b10111110001110101101001000001011),
.kernel_05(32'b00111101000001111111110111011111),
.kernel_06(32'b10111110001001100110101011101101),
.kernel_07(32'b10111101111010010111110101000110),
.kernel_08(32'b10111110000000101011100010111000),
.pxl_out(pxl_out_934), .valid_out(valid_out_934) );

//Channel 935
conv_33 #(D, DATA_WIDTH) x935(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b00111101000010110110000001101101),
.kernel_01(32'b10111100101000010000000100001100),
.kernel_02(32'b00111100011011111011001110000111),
.kernel_03(32'b10111101000101001110001111101001),
.kernel_04(32'b10111101000010110001100101000111),
.kernel_05(32'b10111101100011011101100101100001),
.kernel_06(32'b10111101111110010101011101010111),
.kernel_07(32'b10111101100111110011011010110110),
.kernel_08(32'b00111100100011111101111111110000),
.pxl_out(pxl_out_935), .valid_out(valid_out_935) );

//Channel 936
conv_33 #(D, DATA_WIDTH) x936(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111101001110000100000011011001),
.kernel_01(32'b00111101100011111001011101111000),
.kernel_02(32'b10111101001011000101001011110110),
.kernel_03(32'b10111101010110011011100000011011),
.kernel_04(32'b10111101000001100111100110101111),
.kernel_05(32'b00111011011111010101011100100001),
.kernel_06(32'b10111101010100100111101011010100),
.kernel_07(32'b00111011100110001001101011110000),
.kernel_08(32'b10111101101010100110100111011011),
.pxl_out(pxl_out_936), .valid_out(valid_out_936) );

//Channel 937
conv_33 #(D, DATA_WIDTH) x937(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111101000000000001000110100000),
.kernel_01(32'b10111101111101111100001110110000),
.kernel_02(32'b00111101101010101100110100011110),
.kernel_03(32'b00111101010011111100001100110101),
.kernel_04(32'b10111101100011011011001010111000),
.kernel_05(32'b10111101011101010101101001110001),
.kernel_06(32'b00111100110001110000010011010110),
.kernel_07(32'b10111101100000000010100100001010),
.kernel_08(32'b10111011100100010011101111111010),
.pxl_out(pxl_out_937), .valid_out(valid_out_937) );

//Channel 938
conv_33 #(D, DATA_WIDTH) x938(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b10111101001110011111010000101000),
.kernel_01(32'b00111101011001111101111000001110),
.kernel_02(32'b10111101101111100100010110010101),
.kernel_03(32'b10111101100100111000011110111011),
.kernel_04(32'b00111110001011010001100110010111),
.kernel_05(32'b00111110000010011110010000000111),
.kernel_06(32'b10111101011000011110111010001100),
.kernel_07(32'b00111101110010101110101100101101),
.kernel_08(32'b10111100110011010101010110110111),
.pxl_out(pxl_out_938), .valid_out(valid_out_938) );

//Channel 939
conv_33 #(D, DATA_WIDTH) x939(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111100001010000000101111001010),
.kernel_01(32'b10111100111010100000101101101000),
.kernel_02(32'b00111011100110101110001011111111),
.kernel_03(32'b10111101101001010110110001000001),
.kernel_04(32'b00111011110001101000110001010101),
.kernel_05(32'b10111101111000011100000001101110),
.kernel_06(32'b00111110000100100011000001010100),
.kernel_07(32'b10111100010111101010000111010111),
.kernel_08(32'b10111011111000101110101101100100),
.pxl_out(pxl_out_939), .valid_out(valid_out_939) );

//Channel 940
conv_33 #(D, DATA_WIDTH) x940(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111101100100010011101011011010),
.kernel_01(32'b10111110001011001101010011101001),
.kernel_02(32'b00111110100000110111011001010110),
.kernel_03(32'b00111101000001001100011010010010),
.kernel_04(32'b00111100001110111010001011101111),
.kernel_05(32'b10111101101110011011000101001010),
.kernel_06(32'b10111011010011101001110101000110),
.kernel_07(32'b00111011010101000001100111010001),
.kernel_08(32'b00111100010010010110001100100110),
.pxl_out(pxl_out_940), .valid_out(valid_out_940) );

//Channel 941
conv_33 #(D, DATA_WIDTH) x941(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b10111100011110010011111101010000),
.kernel_01(32'b10111110010101111011011100100010),
.kernel_02(32'b10111101111011011100110001001100),
.kernel_03(32'b10111101000101111011001011101111),
.kernel_04(32'b00111100001000101111110011000111),
.kernel_05(32'b00111110000111101101011101011010),
.kernel_06(32'b00111011111001110110110000010001),
.kernel_07(32'b10111101001100111001111110001001),
.kernel_08(32'b00111101100011100100000110100111),
.pxl_out(pxl_out_941), .valid_out(valid_out_941) );

//Channel 942
conv_33 #(D, DATA_WIDTH) x942(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111010101100000011100100100011),
.kernel_01(32'b00111100110100111100101110011001),
.kernel_02(32'b00111101110011001100011011000010),
.kernel_03(32'b00111101001010110000001101111100),
.kernel_04(32'b00111101001111111100000111111101),
.kernel_05(32'b10111100111011010010000000000101),
.kernel_06(32'b00111011100110100010110011011100),
.kernel_07(32'b10111101000001011000110001110111),
.kernel_08(32'b10111100110111110110110011100111),
.pxl_out(pxl_out_942), .valid_out(valid_out_942) );

//Channel 943
conv_33 #(D, DATA_WIDTH) x943(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b10111110001110010000010101011000),
.kernel_01(32'b10111101010100010010000110101110),
.kernel_02(32'b00111110000100111001100110111100),
.kernel_03(32'b10111101101111000000010001111111),
.kernel_04(32'b00111100010000111010110001111111),
.kernel_05(32'b10111110000001010011001000101101),
.kernel_06(32'b10111100111001100000101101001111),
.kernel_07(32'b00111101000000101100001011010011),
.kernel_08(32'b10111100011011100100001010000001),
.pxl_out(pxl_out_943), .valid_out(valid_out_943) );

//Channel 944
conv_33 #(D, DATA_WIDTH) x944(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b00111101111110011111011011100010),
.kernel_01(32'b10111101111101001111100000000000),
.kernel_02(32'b10111101010110001001011001000111),
.kernel_03(32'b00111101110101100000100110100111),
.kernel_04(32'b00111101010110101001011000101011),
.kernel_05(32'b10111101100101100100011111001101),
.kernel_06(32'b10111110001110100010110011110010),
.kernel_07(32'b10111101000100011101000110010000),
.kernel_08(32'b10111101000010100001111110000110),
.pxl_out(pxl_out_944), .valid_out(valid_out_944) );

//Channel 945
conv_33 #(D, DATA_WIDTH) x945(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b00111101001111111000101101100100),
.kernel_01(32'b00111101110001110001101110111010),
.kernel_02(32'b00111101110000011000100110110100),
.kernel_03(32'b00111101101101010111110001101101),
.kernel_04(32'b00111101111011000101001001001010),
.kernel_05(32'b00111101100100000010111111101001),
.kernel_06(32'b00111110100100100011111110010000),
.kernel_07(32'b00111101011010101001010001110011),
.kernel_08(32'b00111110001101010101111101000001),
.pxl_out(pxl_out_945), .valid_out(valid_out_945) );

//Channel 946
conv_33 #(D, DATA_WIDTH) x946(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b00111101011111111110001011110100),
.kernel_01(32'b10111101100011010110101101110101),
.kernel_02(32'b10111101100111001011100010101000),
.kernel_03(32'b10111110000000001101010110001010),
.kernel_04(32'b00111110000100100101010101001100),
.kernel_05(32'b10111110001100000010011011000111),
.kernel_06(32'b00111101110010011010011101011100),
.kernel_07(32'b10111101000111101110001110111101),
.kernel_08(32'b10111101011000001111100010101000),
.pxl_out(pxl_out_946), .valid_out(valid_out_946) );

//Channel 947
conv_33 #(D, DATA_WIDTH) x947(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b00111101000110010111111101101011),
.kernel_01(32'b00111100101010011110000001011111),
.kernel_02(32'b00111100000101111001101010001010),
.kernel_03(32'b10111100110000011100100101011101),
.kernel_04(32'b00111010011010001011001010101001),
.kernel_05(32'b00111100001100110000011100000110),
.kernel_06(32'b00111101011001100100101011011101),
.kernel_07(32'b10111101011001100100101010010100),
.kernel_08(32'b10111100001100001100101011001110),
.pxl_out(pxl_out_947), .valid_out(valid_out_947) );

//Channel 948
conv_33 #(D, DATA_WIDTH) x948(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111101100000101001000101111001),
.kernel_01(32'b00111110000001100001011100001110),
.kernel_02(32'b00111101101001010001000000111010),
.kernel_03(32'b00111101110000001010010010001001),
.kernel_04(32'b10111100001110010010001010101101),
.kernel_05(32'b00111110000011110101111000101010),
.kernel_06(32'b10111100000111000001010100100000),
.kernel_07(32'b00111100000001011110010011101101),
.kernel_08(32'b10111011100101001100111010101010),
.pxl_out(pxl_out_948), .valid_out(valid_out_948) );

//Channel 949
conv_33 #(D, DATA_WIDTH) x949(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b10111101010101000011100011010101),
.kernel_01(32'b00111101000000000010100000001011),
.kernel_02(32'b00111101111101100100110001110111),
.kernel_03(32'b10111101101101111111111010010010),
.kernel_04(32'b00111101001110110011110001001000),
.kernel_05(32'b10111100111010011001110001010111),
.kernel_06(32'b10111101010100001110011000010111),
.kernel_07(32'b00111101001100011010110110111000),
.kernel_08(32'b10111101111010110101111011100101),
.pxl_out(pxl_out_949), .valid_out(valid_out_949) );

//Channel 950
conv_33 #(D, DATA_WIDTH) x950(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111101010010001111010100011001),
.kernel_01(32'b10111100111000001111001110101111),
.kernel_02(32'b10111101010111101001101100000011),
.kernel_03(32'b00111110000100101111011100100001),
.kernel_04(32'b10111010111011101011000111010110),
.kernel_05(32'b10111011110110001000101011011101),
.kernel_06(32'b10111101111000101011001110111000),
.kernel_07(32'b00111100001001000101000101100111),
.kernel_08(32'b00111101000000000100001010000000),
.pxl_out(pxl_out_950), .valid_out(valid_out_950) );

//Channel 951
conv_33 #(D, DATA_WIDTH) x951(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b10111101001100110011111010000100),
.kernel_01(32'b10111100000110101110011000110100),
.kernel_02(32'b10111100111001101100101001111010),
.kernel_03(32'b10111100001101010001011010001001),
.kernel_04(32'b00111110010101101011110011000010),
.kernel_05(32'b00111101011000011000000101100011),
.kernel_06(32'b00111100100101101000011100001111),
.kernel_07(32'b10111110000100110010011011001010),
.kernel_08(32'b00111111001100111011111000100000),
.pxl_out(pxl_out_951), .valid_out(valid_out_951) );

//Channel 952
conv_33 #(D, DATA_WIDTH) x952(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b10111101101011100001011100110101),
.kernel_01(32'b00111101101010010111101000010001),
.kernel_02(32'b00111110000111001110110001111100),
.kernel_03(32'b00111101100001010001001000100001),
.kernel_04(32'b00111110000000000111110111010001),
.kernel_05(32'b00111101001001000111101001110101),
.kernel_06(32'b00111101111111011001101101110010),
.kernel_07(32'b10111101000101001101100000101001),
.kernel_08(32'b10111010001101000000000101100011),
.pxl_out(pxl_out_952), .valid_out(valid_out_952) );

//Channel 953
conv_33 #(D, DATA_WIDTH) x953(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b10111101001100010111010011000100),
.kernel_01(32'b10111110011011111011000110011111),
.kernel_02(32'b10111111010111110101001101000100),
.kernel_03(32'b00111100111111110001100101110011),
.kernel_04(32'b00111101101101110001100011001110),
.kernel_05(32'b00111100010101011110010110011100),
.kernel_06(32'b10111110010111110000010011001111),
.kernel_07(32'b10111110110011011101101111001100),
.kernel_08(32'b10111110001001000001101000000001),
.pxl_out(pxl_out_953), .valid_out(valid_out_953) );

//Channel 954
conv_33 #(D, DATA_WIDTH) x954(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111011101101001001110101111111),
.kernel_01(32'b00111101110000001011010110010000),
.kernel_02(32'b10111110001011011110100001101101),
.kernel_03(32'b10111100101011100110011001101100),
.kernel_04(32'b10111101100111100000101111111011),
.kernel_05(32'b00111100001010101011100000011000),
.kernel_06(32'b00111100010010101110000100110010),
.kernel_07(32'b10111100000010010000001011000001),
.kernel_08(32'b10111101100010000100110110111101),
.pxl_out(pxl_out_954), .valid_out(valid_out_954) );

//Channel 955
conv_33 #(D, DATA_WIDTH) x955(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b10111101110011111011111011100111),
.kernel_01(32'b10111100011001000101010101110011),
.kernel_02(32'b10111101000110100100000100011100),
.kernel_03(32'b10111110001010100001000010011011),
.kernel_04(32'b00111101101000101000111100111000),
.kernel_05(32'b10111010110001000101111111010000),
.kernel_06(32'b00111101011010110010101100001110),
.kernel_07(32'b00111101000100001101001110011110),
.kernel_08(32'b10111101100100010111100100011011),
.pxl_out(pxl_out_955), .valid_out(valid_out_955) );

//Channel 956
conv_33 #(D, DATA_WIDTH) x956(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111101001000000110101011011000),
.kernel_01(32'b10111101011001000011001001110000),
.kernel_02(32'b10111110001000111000001010110101),
.kernel_03(32'b00111110000001010100100110011100),
.kernel_04(32'b00111011110010101100100110011111),
.kernel_05(32'b00111101110110001111111101101000),
.kernel_06(32'b00111101011100110101001011000001),
.kernel_07(32'b10111101100011101010011010101011),
.kernel_08(32'b00111110100001101111111010111011),
.pxl_out(pxl_out_956), .valid_out(valid_out_956) );

//Channel 957
conv_33 #(D, DATA_WIDTH) x957(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111100001111011101101110010101),
.kernel_01(32'b10111011100111111001100000000101),
.kernel_02(32'b10111101110000011000110011100101),
.kernel_03(32'b00111101110010101101100111101001),
.kernel_04(32'b10111101111001111111001101111010),
.kernel_05(32'b10111110001110001011111111011001),
.kernel_06(32'b00111011001100011011011100001110),
.kernel_07(32'b00111101110011011000111100101000),
.kernel_08(32'b00111100000010111101010111110001),
.pxl_out(pxl_out_957), .valid_out(valid_out_957) );

//Channel 958
conv_33 #(D, DATA_WIDTH) x958(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b10111011111010100111100000110110),
.kernel_01(32'b00111101011000101111000110011111),
.kernel_02(32'b10111100111000000101100011101111),
.kernel_03(32'b00111110001111011001101001011010),
.kernel_04(32'b00111101110101100010010000010000),
.kernel_05(32'b10111101000100101101110111010000),
.kernel_06(32'b10111100000111010110000000100110),
.kernel_07(32'b00111110000101110010101011000100),
.kernel_08(32'b00111101111100110100100111111111),
.pxl_out(pxl_out_958), .valid_out(valid_out_958) );

//Channel 959
conv_33 #(D, DATA_WIDTH) x959(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b00111101010010000011101110000011),
.kernel_01(32'b00111010110010010000101111111011),
.kernel_02(32'b00111010001011101101001010111111),
.kernel_03(32'b10111101000101110100100110110101),
.kernel_04(32'b10111101100101110110101111011101),
.kernel_05(32'b10111101110111010011100111000101),
.kernel_06(32'b10111110011000101000110100001000),
.kernel_07(32'b10111110010011000001101100001001),
.kernel_08(32'b10111110000000010101101101100010),
.pxl_out(pxl_out_959), .valid_out(valid_out_959) );

//Channel 960
conv_33 #(D, DATA_WIDTH) x960(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b00111101100110011100110000000010),
.kernel_01(32'b10111101100111111110000001111110),
.kernel_02(32'b10111101000101100001010000101101),
.kernel_03(32'b00111101000010101010011001010101),
.kernel_04(32'b00111101001010100100000000110011),
.kernel_05(32'b00111101000001010101000110110101),
.kernel_06(32'b00111101101010010010001011001010),
.kernel_07(32'b00111110000000000110100101111011),
.kernel_08(32'b10111100101110000010111101100100),
.pxl_out(pxl_out_960), .valid_out(valid_out_960) );

//Channel 961
conv_33 #(D, DATA_WIDTH) x961(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b00111100100110010111000100000010),
.kernel_01(32'b10111100001111001011101100101000),
.kernel_02(32'b10111101000010101010010010101111),
.kernel_03(32'b00111100000110000100001101000111),
.kernel_04(32'b10111101111101101000101010100001),
.kernel_05(32'b10111101001110011100110000111110),
.kernel_06(32'b00111101100110111000101100111011),
.kernel_07(32'b00111100010010001001110100000000),
.kernel_08(32'b10111100001100101101110000101011),
.pxl_out(pxl_out_961), .valid_out(valid_out_961) );

//Channel 962
conv_33 #(D, DATA_WIDTH) x962(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111101000000101101001100100000),
.kernel_01(32'b10111100001000011110011011011111),
.kernel_02(32'b00111100110000101010011000101011),
.kernel_03(32'b00111100010001000010101000000111),
.kernel_04(32'b10111101010100100010101101101110),
.kernel_05(32'b00111010110001111110111000011110),
.kernel_06(32'b10111100000101010010100010100111),
.kernel_07(32'b00111101100001000011010001001010),
.kernel_08(32'b00111110000101111011000111011011),
.pxl_out(pxl_out_962), .valid_out(valid_out_962) );

//Channel 963
conv_33 #(D, DATA_WIDTH) x963(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111011100100010100000101000001),
.kernel_01(32'b10111100100100110000000010010000),
.kernel_02(32'b00111100001110001011011110111100),
.kernel_03(32'b10111101100100110000000011110001),
.kernel_04(32'b00111100001101010100100110000101),
.kernel_05(32'b00111011100011101110111101001010),
.kernel_06(32'b00111101100010000011001011000110),
.kernel_07(32'b10111100011001000011000001010000),
.kernel_08(32'b00111101100000111110001111111110),
.pxl_out(pxl_out_963), .valid_out(valid_out_963) );

//Channel 964
conv_33 #(D, DATA_WIDTH) x964(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b00111101001000101101110010110011),
.kernel_01(32'b10111101010001101111110110001111),
.kernel_02(32'b10111101000010000000101010110111),
.kernel_03(32'b10111110001100111000000110101000),
.kernel_04(32'b00111101000010101011010101111010),
.kernel_05(32'b10111110001111011011110001101101),
.kernel_06(32'b10111100001100111101111111111101),
.kernel_07(32'b10111101100010010010010011101100),
.kernel_08(32'b10111100011010111010101100100011),
.pxl_out(pxl_out_964), .valid_out(valid_out_964) );

//Channel 965
conv_33 #(D, DATA_WIDTH) x965(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b00111100101001011000100100011010),
.kernel_01(32'b10111101100111101011001101010011),
.kernel_02(32'b00111101101001000011001111011011),
.kernel_03(32'b10111101101000000110110110000010),
.kernel_04(32'b00111101101001100011101001100010),
.kernel_05(32'b00111101100001011011101000101100),
.kernel_06(32'b00111101010101111001010011100101),
.kernel_07(32'b10111101010010110001001011101000),
.kernel_08(32'b00111100111110001001001100101101),
.pxl_out(pxl_out_965), .valid_out(valid_out_965) );

//Channel 966
conv_33 #(D, DATA_WIDTH) x966(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111110001011100010110111110110),
.kernel_01(32'b10111100101010110010011111101110),
.kernel_02(32'b10111110010111010011100111010101),
.kernel_03(32'b00111101010100111111000010110110),
.kernel_04(32'b10111110011111110100011001111110),
.kernel_05(32'b00111101110110010011011101111000),
.kernel_06(32'b00111101011001011000100101010001),
.kernel_07(32'b10111101111010010001110011000011),
.kernel_08(32'b00111100111111011011010001110101),
.pxl_out(pxl_out_966), .valid_out(valid_out_966) );

//Channel 967
conv_33 #(D, DATA_WIDTH) x967(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b00111011111000001101111001000100),
.kernel_01(32'b10111101000010101111111101100101),
.kernel_02(32'b10111101110010110101010001001001),
.kernel_03(32'b10111101101111000100101100100010),
.kernel_04(32'b00111110001001101101011101111000),
.kernel_05(32'b00111101000011010010100001110000),
.kernel_06(32'b10111110011110100111100101100100),
.kernel_07(32'b00111101010100111000100010100101),
.kernel_08(32'b00111110010100001000000011101101),
.pxl_out(pxl_out_967), .valid_out(valid_out_967) );

//Channel 968
conv_33 #(D, DATA_WIDTH) x968(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111110001001111010001011001101),
.kernel_01(32'b00111100110110111111100001101110),
.kernel_02(32'b10111011111111000010100001101001),
.kernel_03(32'b10111101010001001011000100001110),
.kernel_04(32'b10111101011100101101101100111100),
.kernel_05(32'b00111101010100010010010000110011),
.kernel_06(32'b00111110000100111011000010000011),
.kernel_07(32'b10111101111101001010010101011001),
.kernel_08(32'b10111101100001000100111111000110),
.pxl_out(pxl_out_968), .valid_out(valid_out_968) );

//Channel 969
conv_33 #(D, DATA_WIDTH) x969(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111100110011010010111111000000),
.kernel_01(32'b00111011111001100010100100110011),
.kernel_02(32'b00111110000111101011111100011110),
.kernel_03(32'b00111101100010111110101111111010),
.kernel_04(32'b10111101100001010100011011100011),
.kernel_05(32'b10111101000101001001111011000000),
.kernel_06(32'b00111110111110001100110000111111),
.kernel_07(32'b10111100111000111100110011101111),
.kernel_08(32'b00111100111100000011000101000110),
.pxl_out(pxl_out_969), .valid_out(valid_out_969) );

//Channel 970
conv_33 #(D, DATA_WIDTH) x970(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111101000010010100110001111110),
.kernel_01(32'b00111101011101111111100101001110),
.kernel_02(32'b10111100011011011100001001011110),
.kernel_03(32'b00111010011111111001101000010100),
.kernel_04(32'b00111110000001000111001100100000),
.kernel_05(32'b00111100101111001101100101010101),
.kernel_06(32'b10111100010110010110101100101001),
.kernel_07(32'b00111011110110001001010101111000),
.kernel_08(32'b10111110011100011010111101110100),
.pxl_out(pxl_out_970), .valid_out(valid_out_970) );

//Channel 971
conv_33 #(D, DATA_WIDTH) x971(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b10111111001111111010011010101111),
.kernel_01(32'b10111100100001000001010010000111),
.kernel_02(32'b00111101110100010101110111011110),
.kernel_03(32'b00111101100010011101011111110111),
.kernel_04(32'b10111101010101101100011010100101),
.kernel_05(32'b10111101110000000111000100001101),
.kernel_06(32'b00111110110111111011111111000101),
.kernel_07(32'b00111101111101101001111110010001),
.kernel_08(32'b00111110010010100110010101110100),
.pxl_out(pxl_out_971), .valid_out(valid_out_971) );

//Channel 972
conv_33 #(D, DATA_WIDTH) x972(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b00111100101110100011100111010011),
.kernel_01(32'b00111010101100011001010000011000),
.kernel_02(32'b10111100110111000101100101011111),
.kernel_03(32'b10111101100011111000101101011110),
.kernel_04(32'b00111101010101010100101011100110),
.kernel_05(32'b10111110010000000011001000000011),
.kernel_06(32'b10111110100110011110000100001101),
.kernel_07(32'b10111011101101000110100110101110),
.kernel_08(32'b00111101111011111101010111010110),
.pxl_out(pxl_out_972), .valid_out(valid_out_972) );

//Channel 973
conv_33 #(D, DATA_WIDTH) x973(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b00111101110000010111110110100100),
.kernel_01(32'b10111110100001001011000010000001),
.kernel_02(32'b10111010110101111010111000111100),
.kernel_03(32'b10111101110010110110011000010011),
.kernel_04(32'b00111101001100010110110011100111),
.kernel_05(32'b00111101111001110100000100111011),
.kernel_06(32'b10111101111101010100110010101001),
.kernel_07(32'b00111101100010101111001010011100),
.kernel_08(32'b00111110001011010100101101100001),
.pxl_out(pxl_out_973), .valid_out(valid_out_973) );

//Channel 974
conv_33 #(D, DATA_WIDTH) x974(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111110011001100001000101111111),
.kernel_01(32'b10111101011101000010001111100111),
.kernel_02(32'b10111110011001111101101001111011),
.kernel_03(32'b00111101110011110011110010001000),
.kernel_04(32'b10111100100010101000110100011101),
.kernel_05(32'b10111101001101111011100011110111),
.kernel_06(32'b10111101111100110000110000100010),
.kernel_07(32'b10111110000101110101110001100011),
.kernel_08(32'b00111101100000010010101110101000),
.pxl_out(pxl_out_974), .valid_out(valid_out_974) );

//Channel 975
conv_33 #(D, DATA_WIDTH) x975(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b10111110000000101111000110100101),
.kernel_01(32'b00111101100010101001111000010010),
.kernel_02(32'b10111110100000111011111000100100),
.kernel_03(32'b00111100010010110010001000110110),
.kernel_04(32'b10111101111001100011110101100000),
.kernel_05(32'b10111100100101011011111011100111),
.kernel_06(32'b10111011101011010110110011100101),
.kernel_07(32'b10111110110101111000001101100111),
.kernel_08(32'b00111110000001110001101111001011),
.pxl_out(pxl_out_975), .valid_out(valid_out_975) );

//Channel 976
conv_33 #(D, DATA_WIDTH) x976(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111101001110110111011000101000),
.kernel_01(32'b00111101001011000110100111100000),
.kernel_02(32'b00111101101000000010100010011100),
.kernel_03(32'b10111001100011110011010011101010),
.kernel_04(32'b00111101100001110000100000000011),
.kernel_05(32'b10111100010000100100010011011110),
.kernel_06(32'b00111110100010011101111001110110),
.kernel_07(32'b00111110110110011010000111001010),
.kernel_08(32'b10111110010000110100000001010110),
.pxl_out(pxl_out_976), .valid_out(valid_out_976) );

//Channel 977
conv_33 #(D, DATA_WIDTH) x977(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b00111100101000101100100000101001),
.kernel_01(32'b10111110100101011110110101100111),
.kernel_02(32'b00111101100110000011011101010011),
.kernel_03(32'b00111100011101110101111000110001),
.kernel_04(32'b10111101110111001001010110111110),
.kernel_05(32'b10111101101001101000001011001111),
.kernel_06(32'b00111010100101100110011010011101),
.kernel_07(32'b00111010100101011010111100100111),
.kernel_08(32'b10111110000000011101010100000100),
.pxl_out(pxl_out_977), .valid_out(valid_out_977) );

//Channel 978
conv_33 #(D, DATA_WIDTH) x978(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b00111101100011101011011111010011),
.kernel_01(32'b00111011100110101001110101101100),
.kernel_02(32'b00111101001110001010101111101101),
.kernel_03(32'b10111110101110011000101001001101),
.kernel_04(32'b00111110000000111101001101100111),
.kernel_05(32'b00111110011111111010011110110111),
.kernel_06(32'b10111100011100010110010110100011),
.kernel_07(32'b00111110000011001101110100000010),
.kernel_08(32'b00111011011000010101100111100111),
.pxl_out(pxl_out_978), .valid_out(valid_out_978) );

//Channel 979
conv_33 #(D, DATA_WIDTH) x979(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111101001001100011000110111110),
.kernel_01(32'b00111101110011100110111011110011),
.kernel_02(32'b10111110000000010101101101001110),
.kernel_03(32'b10111101101110100000011010111100),
.kernel_04(32'b00111101111000000110000100000101),
.kernel_05(32'b00111100011001011110001001001000),
.kernel_06(32'b10111101101110101010111001101100),
.kernel_07(32'b00111100000101010100100010110011),
.kernel_08(32'b00111011001001101101101100100011),
.pxl_out(pxl_out_979), .valid_out(valid_out_979) );

//Channel 980
conv_33 #(D, DATA_WIDTH) x980(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111101100101100010010110011001),
.kernel_01(32'b00111100111010110001100100101010),
.kernel_02(32'b10111110001001011111001001010100),
.kernel_03(32'b00111101100001110010001000111010),
.kernel_04(32'b10111101111111011101010100111111),
.kernel_05(32'b00111100111000111001101010001100),
.kernel_06(32'b00111110010100001001011010001110),
.kernel_07(32'b00111100100011110011011101011110),
.kernel_08(32'b00111011010101010010000001011111),
.pxl_out(pxl_out_980), .valid_out(valid_out_980) );

//Channel 981
conv_33 #(D, DATA_WIDTH) x981(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b00111101100000110101101011010000),
.kernel_01(32'b10111110001010001010011010110111),
.kernel_02(32'b10111101010101011101100010100101),
.kernel_03(32'b00111101010100011010110101101011),
.kernel_04(32'b00111101101001110001101001100100),
.kernel_05(32'b10111101000000100111000110010100),
.kernel_06(32'b00111101011101110001111101001000),
.kernel_07(32'b00111100000010010011000001010011),
.kernel_08(32'b10111101010010110101100011010110),
.pxl_out(pxl_out_981), .valid_out(valid_out_981) );

//Channel 982
conv_33 #(D, DATA_WIDTH) x982(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111101100101111100011110110011),
.kernel_01(32'b10111110010100110100001101111000),
.kernel_02(32'b00111100011111100011101010101110),
.kernel_03(32'b00111110000110110010001101100010),
.kernel_04(32'b10111100011101110110001010110001),
.kernel_05(32'b10111101000001101110000110100011),
.kernel_06(32'b10111101010101001001111100000100),
.kernel_07(32'b10111101100101111001010001011010),
.kernel_08(32'b10111110011101010111010010110011),
.pxl_out(pxl_out_982), .valid_out(valid_out_982) );

//Channel 983
conv_33 #(D, DATA_WIDTH) x983(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b00111010100001110010101100100011),
.kernel_01(32'b10111101110000111110001101010001),
.kernel_02(32'b10111100101011011011101100010001),
.kernel_03(32'b10111100110010001011010011100000),
.kernel_04(32'b00111101010011110110000100100111),
.kernel_05(32'b00111100011000101111111100011110),
.kernel_06(32'b10111011100101111100001000011010),
.kernel_07(32'b10111110000010111100010010100001),
.kernel_08(32'b00111110011000101000101010011101),
.pxl_out(pxl_out_983), .valid_out(valid_out_983) );

//Channel 984
conv_33 #(D, DATA_WIDTH) x984(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111100100011001000100011100001),
.kernel_01(32'b10111011110110101001010010000110),
.kernel_02(32'b00111110001110111000011110101111),
.kernel_03(32'b10111011010111000010010010100011),
.kernel_04(32'b00111101101100001110001100000000),
.kernel_05(32'b00111101010010001000101101011111),
.kernel_06(32'b00111101010110101101001111010000),
.kernel_07(32'b00111100010000111011101100011000),
.kernel_08(32'b00111101000010001100001110011110),
.pxl_out(pxl_out_984), .valid_out(valid_out_984) );

//Channel 985
conv_33 #(D, DATA_WIDTH) x985(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111100101010101111111000110011),
.kernel_01(32'b00111011101111110011011101111010),
.kernel_02(32'b10111101110100111010110101000101),
.kernel_03(32'b00111100101011011100001000001001),
.kernel_04(32'b00111100111011011100000001111100),
.kernel_05(32'b10111100011111111011010001001011),
.kernel_06(32'b10111110001010100000111001000011),
.kernel_07(32'b10111101011110010001110001000111),
.kernel_08(32'b10111101110001010011111010000001),
.pxl_out(pxl_out_985), .valid_out(valid_out_985) );

//Channel 986
conv_33 #(D, DATA_WIDTH) x986(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111101011110110100001010001001),
.kernel_01(32'b10111110100100100100111101010100),
.kernel_02(32'b10111101001010011110010011000110),
.kernel_03(32'b00111100100001011010110110001000),
.kernel_04(32'b10111101010011011100001100001100),
.kernel_05(32'b00111110001111001101011011111000),
.kernel_06(32'b00111100001010010001001100010000),
.kernel_07(32'b00111011110101011000100011111010),
.kernel_08(32'b00111110000001101000111111110101),
.pxl_out(pxl_out_986), .valid_out(valid_out_986) );

//Channel 987
conv_33 #(D, DATA_WIDTH) x987(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b10111100111100101110010010000100),
.kernel_01(32'b00111101110110111000111010101100),
.kernel_02(32'b10111101110011100110110111010100),
.kernel_03(32'b00111101000110111100111011001011),
.kernel_04(32'b10111100110000101100010001001111),
.kernel_05(32'b00111010111000011111101001111100),
.kernel_06(32'b00111110001011011101100100110110),
.kernel_07(32'b00111111000010101001110110100100),
.kernel_08(32'b00111100111000010101101101010100),
.pxl_out(pxl_out_987), .valid_out(valid_out_987) );

//Channel 988
conv_33 #(D, DATA_WIDTH) x988(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111011100001100010100001101101),
.kernel_01(32'b00111101011101100010001001100000),
.kernel_02(32'b10111110100011111011001011001011),
.kernel_03(32'b10111110001101011011001001110000),
.kernel_04(32'b00111100110100110110110011101011),
.kernel_05(32'b00111101100011111000000010111010),
.kernel_06(32'b00111101100100111011100100100001),
.kernel_07(32'b10111101000100101110010101101110),
.kernel_08(32'b10111101001011011011101001011010),
.pxl_out(pxl_out_988), .valid_out(valid_out_988) );

//Channel 989
conv_33 #(D, DATA_WIDTH) x989(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111110000111101010111010000000),
.kernel_01(32'b10111011110101001111010011111101),
.kernel_02(32'b10111110100010010111010010001101),
.kernel_03(32'b00111101011001000011011111101100),
.kernel_04(32'b10111101101110111100111110000011),
.kernel_05(32'b10111011111001000000110010001100),
.kernel_06(32'b10111100111101000001000000111100),
.kernel_07(32'b00111101000101011010011110101111),
.kernel_08(32'b00111100001000101100110000110010),
.pxl_out(pxl_out_989), .valid_out(valid_out_989) );

//Channel 990
conv_33 #(D, DATA_WIDTH) x990(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b00111110101000010001111010000111),
.kernel_01(32'b00111011101010000100000000111101),
.kernel_02(32'b00111101110111010000100100110011),
.kernel_03(32'b00111100111100000000000000001110),
.kernel_04(32'b00111011111100010000011011011001),
.kernel_05(32'b00111101100010101101000001101111),
.kernel_06(32'b10111100010111000100000111011000),
.kernel_07(32'b10111100000001001110000001011010),
.kernel_08(32'b00111101111110011101101000100011),
.pxl_out(pxl_out_990), .valid_out(valid_out_990) );

//Channel 991
conv_33 #(D, DATA_WIDTH) x991(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111110100101100000101110001110),
.kernel_01(32'b10111110000010110111101010110000),
.kernel_02(32'b10111101000111100101010010110100),
.kernel_03(32'b10111110000111110111101101000010),
.kernel_04(32'b00111100111000110010100011000100),
.kernel_05(32'b10111110010001110101000101110110),
.kernel_06(32'b10111101011000101101000011010001),
.kernel_07(32'b10111011101100001101110011000010),
.kernel_08(32'b10111011110010111111111010101101),
.pxl_out(pxl_out_991), .valid_out(valid_out_991) );

//Channel 992
conv_33 #(D, DATA_WIDTH) x992(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b00111100000111110001001000011010),
.kernel_01(32'b10111101010001100001110000001100),
.kernel_02(32'b10111100101001001111101000001011),
.kernel_03(32'b10111011110110111011110100010001),
.kernel_04(32'b00111101000010001000000010101110),
.kernel_05(32'b10111101111111111111110110100111),
.kernel_06(32'b00111100010010000110011101100000),
.kernel_07(32'b00111110000111101001001100000111),
.kernel_08(32'b10111101010010100011100111111010),
.pxl_out(pxl_out_992), .valid_out(valid_out_992) );

//Channel 993
conv_33 #(D, DATA_WIDTH) x993(.clk(clk), .reset(reset), .valid_in(valid_in_1), .pxl_in(pxl_in_1),
.kernel_00(32'b10111110001010111111111110011000),
.kernel_01(32'b00111101001010000010101111000110),
.kernel_02(32'b00111100000101111000101011100000),
.kernel_03(32'b00111100111001011100110110100101),
.kernel_04(32'b10111011001001001110110111111110),
.kernel_05(32'b00111101001100000110001000111100),
.kernel_06(32'b00111110000100010011111111010010),
.kernel_07(32'b00111100100001111110111001000110),
.kernel_08(32'b00111110101011000001001111000010),
.pxl_out(pxl_out_993), .valid_out(valid_out_993) );

//Channel 994
conv_33 #(D, DATA_WIDTH) x994(.clk(clk), .reset(reset), .valid_in(valid_in_2), .pxl_in(pxl_in_2),
.kernel_00(32'b10111011111110101010100011110110),
.kernel_01(32'b00111101110001011110011111011010),
.kernel_02(32'b10111101001001100010011001011101),
.kernel_03(32'b00111101001010011011011100001011),
.kernel_04(32'b00111100110101101110011010000110),
.kernel_05(32'b10111101110111111001011100111101),
.kernel_06(32'b10111010101101110100111100101110),
.kernel_07(32'b10111011111100011000001011100101),
.kernel_08(32'b10111110001010001011011111011000),
.pxl_out(pxl_out_994), .valid_out(valid_out_994) );

//Channel 995
conv_33 #(D, DATA_WIDTH) x995(.clk(clk), .reset(reset), .valid_in(valid_in_3), .pxl_in(pxl_in_3),
.kernel_00(32'b00111101101101101000101111110100),
.kernel_01(32'b10111101110110010101110110001100),
.kernel_02(32'b10111110100010111000010100111010),
.kernel_03(32'b10111101001000100111010010010100),
.kernel_04(32'b10111110100010000000011101100010),
.kernel_05(32'b10111100111001110111111110000101),
.kernel_06(32'b00111101001110101010011010100000),
.kernel_07(32'b10111101111110011000100100111010),
.kernel_08(32'b00111101111001000000101001101111),
.pxl_out(pxl_out_995), .valid_out(valid_out_995) );

//Channel 996
conv_33 #(D, DATA_WIDTH) x996(.clk(clk), .reset(reset), .valid_in(valid_in_4), .pxl_in(pxl_in_4),
.kernel_00(32'b10111101100110011101000001010001),
.kernel_01(32'b10111100110101100100011000010001),
.kernel_02(32'b10111101010101011111110111010100),
.kernel_03(32'b00111101100011010001101110110010),
.kernel_04(32'b10111101101001111111001111010010),
.kernel_05(32'b10111101001001101100101011111000),
.kernel_06(32'b00111101010101011010000011110110),
.kernel_07(32'b10111110001011111110001111110100),
.kernel_08(32'b10111101100000001011000100010011),
.pxl_out(pxl_out_996), .valid_out(valid_out_996) );

//Channel 997
conv_33 #(D, DATA_WIDTH) x997(.clk(clk), .reset(reset), .valid_in(valid_in_5), .pxl_in(pxl_in_5),
.kernel_00(32'b10111011111110101001001100111011),
.kernel_01(32'b10111101110101001101001000011010),
.kernel_02(32'b00111011011011011110111000010100),
.kernel_03(32'b10111011101110100001000011010111),
.kernel_04(32'b00111101111010101100100110110010),
.kernel_05(32'b00111100000010001010000010010000),
.kernel_06(32'b10111101101101100110100010101000),
.kernel_07(32'b00111101111011100111101010000010),
.kernel_08(32'b10111101110010110011101010010010),
.pxl_out(pxl_out_997), .valid_out(valid_out_997) );

//Channel 998
conv_33 #(D, DATA_WIDTH) x998(.clk(clk), .reset(reset), .valid_in(valid_in_6), .pxl_in(pxl_in_6),
.kernel_00(32'b00111101001111001101100101101000),
.kernel_01(32'b10111101101001111111100110000000),
.kernel_02(32'b10111100011111111011010111111001),
.kernel_03(32'b00111110001001011000101111100110),
.kernel_04(32'b00111110110000111100011100100100),
.kernel_05(32'b00111100100110101110100001100100),
.kernel_06(32'b10111101010110111000110010010001),
.kernel_07(32'b10111101100111001010101101111010),
.kernel_08(32'b00111110000001101111001100011010),
.pxl_out(pxl_out_998), .valid_out(valid_out_998) );

//Channel 999
conv_33 #(D, DATA_WIDTH) x999(.clk(clk), .reset(reset), .valid_in(valid_in_7), .pxl_in(pxl_in_7),
.kernel_00(32'b00111110001111001000010101101010),
.kernel_01(32'b00111110000001001000101000010111),
.kernel_02(32'b00111101110100111000111111010111),
.kernel_03(32'b10111100010000111100100011000110),
.kernel_04(32'b10111101001111010110110110011001),
.kernel_05(32'b10111010100101001100011110100100),
.kernel_06(32'b00111010110110010001011101000110),
.kernel_07(32'b00111110000011111101011001001111),
.kernel_08(32'b10111110100001011100000111001011),
.pxl_out(pxl_out_999), .valid_out(valid_out_999) );

//Channel 1000
conv_33 #(D, DATA_WIDTH) x1000(.clk(clk), .reset(reset), .valid_in(valid_in_8), .pxl_in(pxl_in_8),
.kernel_00(32'b00111011010000010110100101011100),
.kernel_01(32'b00111110011001010010010011000010),
.kernel_02(32'b00111100110111110100010111000110),
.kernel_03(32'b10111100010110000000000010110011),
.kernel_04(32'b10111101101111101101010001000111),
.kernel_05(32'b10111100110110101011100000111011),
.kernel_06(32'b10111111001001100110111011110100),
.kernel_07(32'b10111100000111000111101011010110),
.kernel_08(32'b10111110101111100101001111110011),
.pxl_out(pxl_out_1000), .valid_out(valid_out_1000) );

//Channel 1001
conv_33 #(D, DATA_WIDTH) x1001(.clk(clk), .reset(reset), .valid_in(valid_in_9), .pxl_in(pxl_in_9),
.kernel_00(32'b10111100100010010001001101110000),
.kernel_01(32'b10111011011100110000111011011010),
.kernel_02(32'b00111101011100010011010011111000),
.kernel_03(32'b10111100010100000111100001011010),
.kernel_04(32'b00111101010101110000100101000111),
.kernel_05(32'b10111110011010001011001000111101),
.kernel_06(32'b00111110100110100110111011101011),
.kernel_07(32'b00111110100000011100100101100100),
.kernel_08(32'b10111000110011011001010111001100),
.pxl_out(pxl_out_1001), .valid_out(valid_out_1001) );

//Channel 1002
conv_33 #(D, DATA_WIDTH) x1002(.clk(clk), .reset(reset), .valid_in(valid_in_10), .pxl_in(pxl_in_10),
.kernel_00(32'b00111110101001001111100011101010),
.kernel_01(32'b00111101000110111110000111101110),
.kernel_02(32'b00111110011001001011011001111101),
.kernel_03(32'b10111100111111110110011110101000),
.kernel_04(32'b00111101110011011111110010010101),
.kernel_05(32'b10111101100011000110111111000000),
.kernel_06(32'b00111100010000100010010010010010),
.kernel_07(32'b00111100000101101101000011010010),
.kernel_08(32'b00111110000010111100010111010100),
.pxl_out(pxl_out_1002), .valid_out(valid_out_1002) );

//Channel 1003
conv_33 #(D, DATA_WIDTH) x1003(.clk(clk), .reset(reset), .valid_in(valid_in_11), .pxl_in(pxl_in_11),
.kernel_00(32'b00111110100011111101011110011100),
.kernel_01(32'b00111011110010010110101110001001),
.kernel_02(32'b00111100101001111001010000110101),
.kernel_03(32'b00111110011010111110010010101001),
.kernel_04(32'b10111110101010110111011000000110),
.kernel_05(32'b10111101000000110001111111100000),
.kernel_06(32'b00111111010011111110100011010110),
.kernel_07(32'b10111100100001011000001101110110),
.kernel_08(32'b00111110001111001011100001001110),
.pxl_out(pxl_out_1003), .valid_out(valid_out_1003) );

//Channel 1004
conv_33 #(D, DATA_WIDTH) x1004(.clk(clk), .reset(reset), .valid_in(valid_in_12), .pxl_in(pxl_in_12),
.kernel_00(32'b10111101000100011101000010011011),
.kernel_01(32'b10111011001001111101110111101101),
.kernel_02(32'b10111101101110000010100101110011),
.kernel_03(32'b10111101000001010110001000111101),
.kernel_04(32'b10111101110000111100010011110111),
.kernel_05(32'b10111110101000001011101110001010),
.kernel_06(32'b00111101001010111100101010100011),
.kernel_07(32'b00111101010110110101101000011111),
.kernel_08(32'b00111100111111110000110011001010),
.pxl_out(pxl_out_1004), .valid_out(valid_out_1004) );

//Channel 1005
conv_33 #(D, DATA_WIDTH) x1005(.clk(clk), .reset(reset), .valid_in(valid_in_13), .pxl_in(pxl_in_13),
.kernel_00(32'b10111101000111011100100001100110),
.kernel_01(32'b10111111001000110011101111100110),
.kernel_02(32'b00111101010110000001101100001100),
.kernel_03(32'b10111101000110101000111011110000),
.kernel_04(32'b10111100011010000010111110011101),
.kernel_05(32'b00111111100100110110001010101111),
.kernel_06(32'b10111101100110111110110100000110),
.kernel_07(32'b00111101001001001000101110100000),
.kernel_08(32'b00111110101011111110111001110000),
.pxl_out(pxl_out_1005), .valid_out(valid_out_1005) );

//Channel 1006
conv_33 #(D, DATA_WIDTH) x1006(.clk(clk), .reset(reset), .valid_in(valid_in_14), .pxl_in(pxl_in_14),
.kernel_00(32'b00111110000101111101001110011100),
.kernel_01(32'b10111101110100001111101011010111),
.kernel_02(32'b00111110100100010101111100100111),
.kernel_03(32'b00111110001001100010110110110001),
.kernel_04(32'b10111101100111011000000000111001),
.kernel_05(32'b10111110010000101010111011100011),
.kernel_06(32'b10111110011000110110110111100001),
.kernel_07(32'b00111101011100000101010100001000),
.kernel_08(32'b10111110000101011110000100010101),
.pxl_out(pxl_out_1006), .valid_out(valid_out_1006) );

//Channel 1007
conv_33 #(D, DATA_WIDTH) x1007(.clk(clk), .reset(reset), .valid_in(valid_in_15), .pxl_in(pxl_in_15),
.kernel_00(32'b10111111100110000110110111000011),
.kernel_01(32'b10111100111111010101011111011010),
.kernel_02(32'b10111111000100111110111100001110),
.kernel_03(32'b00110111110000010001000010011001),
.kernel_04(32'b10111110000010001000000011111110),
.kernel_05(32'b10111101100111001000101110101101),
.kernel_06(32'b10111100001111000100000011111011),
.kernel_07(32'b10111110110110001100110101101101),
.kernel_08(32'b00111101010110001011010000010011),
.pxl_out(pxl_out_1007), .valid_out(valid_out_1007) );

//Channel 1008
conv_33 #(D, DATA_WIDTH) x1008(.clk(clk), .reset(reset), .valid_in(valid_in_16), .pxl_in(pxl_in_16),
.kernel_00(32'b10111101011100111111010001000101),
.kernel_01(32'b00111110000111101101001101110100),
.kernel_02(32'b00111100110001001010100111011010),
.kernel_03(32'b10111101010111111101100111000010),
.kernel_04(32'b10111101110111111001010110001111),
.kernel_05(32'b00111110000000111001110110101110),
.kernel_06(32'b00111111000001111110100101110100),
.kernel_07(32'b00111110011111101000010101111111),
.kernel_08(32'b00111110001001101111100001101111),
.pxl_out(pxl_out_1008), .valid_out(valid_out_1008) );

//Channel 1009
conv_33 #(D, DATA_WIDTH) x1009(.clk(clk), .reset(reset), .valid_in(valid_in_17), .pxl_in(pxl_in_17),
.kernel_00(32'b10111100111100001000011000110010),
.kernel_01(32'b10111111001100001011000001100101),
.kernel_02(32'b00111101011100001000011001000110),
.kernel_03(32'b00111101110011111100100000000100),
.kernel_04(32'b10111110001111000000011000111010),
.kernel_05(32'b10111101010010100111011110110110),
.kernel_06(32'b00111101001001111011001010010111),
.kernel_07(32'b10111101101110011111111011100101),
.kernel_08(32'b10111101111000011101001101000101),
.pxl_out(pxl_out_1009), .valid_out(valid_out_1009) );

//Channel 1010
conv_33 #(D, DATA_WIDTH) x1010(.clk(clk), .reset(reset), .valid_in(valid_in_18), .pxl_in(pxl_in_18),
.kernel_00(32'b00111101110001001000100111101001),
.kernel_01(32'b00111110001110000000110010100100),
.kernel_02(32'b10111101000011001101011101000011),
.kernel_03(32'b10111110010011111111000011101001),
.kernel_04(32'b00111110010010001001111110001111),
.kernel_05(32'b00111111000111110110001101000110),
.kernel_06(32'b00111100100011101000110101101011),
.kernel_07(32'b00111110100101110010011011011011),
.kernel_08(32'b00111101110110001010101100011000),
.pxl_out(pxl_out_1010), .valid_out(valid_out_1010) );

//Channel 1011
conv_33 #(D, DATA_WIDTH) x1011(.clk(clk), .reset(reset), .valid_in(valid_in_19), .pxl_in(pxl_in_19),
.kernel_00(32'b10111101000111000011000101011001),
.kernel_01(32'b10111110000010100010001111000101),
.kernel_02(32'b10111100001101000001000011111111),
.kernel_03(32'b00111101100010110111111111110111),
.kernel_04(32'b00111110011101111000100100100110),
.kernel_05(32'b10111101000001111001101101010110),
.kernel_06(32'b10111101011001000010110010001011),
.kernel_07(32'b00111101010010011000111111100000),
.kernel_08(32'b00111101100101010101001110010110),
.pxl_out(pxl_out_1011), .valid_out(valid_out_1011) );

//Channel 1012
conv_33 #(D, DATA_WIDTH) x1012(.clk(clk), .reset(reset), .valid_in(valid_in_20), .pxl_in(pxl_in_20),
.kernel_00(32'b00111110000010111100101110000100),
.kernel_01(32'b00111110000000010011110110110101),
.kernel_02(32'b10111110000110011010011111101000),
.kernel_03(32'b10111101011110000110110011010110),
.kernel_04(32'b10111100101100011010011111110000),
.kernel_05(32'b10111101101001100101001101011011),
.kernel_06(32'b10111110010101111100000000000010),
.kernel_07(32'b10111100101111011001010001110111),
.kernel_08(32'b10111101101100001110000011010011),
.pxl_out(pxl_out_1012), .valid_out(valid_out_1012) );

//Channel 1013
conv_33 #(D, DATA_WIDTH) x1013(.clk(clk), .reset(reset), .valid_in(valid_in_21), .pxl_in(pxl_in_21),
.kernel_00(32'b10111011110000100010010011000011),
.kernel_01(32'b00111110011111110110100110000111),
.kernel_02(32'b10111101011100110001011010000110),
.kernel_03(32'b00111101001011011111010110000001),
.kernel_04(32'b10111101101110101111000001001001),
.kernel_05(32'b10111110000000011011110100000010),
.kernel_06(32'b00111101010111010100100111101110),
.kernel_07(32'b10111110000000010100111100110101),
.kernel_08(32'b00111101101000001001100101001110),
.pxl_out(pxl_out_1013), .valid_out(valid_out_1013) );

//Channel 1014
conv_33 #(D, DATA_WIDTH) x1014(.clk(clk), .reset(reset), .valid_in(valid_in_22), .pxl_in(pxl_in_22),
.kernel_00(32'b10111110000000001011111001110111),
.kernel_01(32'b00111110011010110101111001000000),
.kernel_02(32'b10111101001001110100101110101111),
.kernel_03(32'b00111111011101010010101001011011),
.kernel_04(32'b00111110010111001111001010001011),
.kernel_05(32'b00111100100100110011001110100001),
.kernel_06(32'b10111101010110110011000111011101),
.kernel_07(32'b00111100111010000100010000100111),
.kernel_08(32'b10111101001011111110110100010110),
.pxl_out(pxl_out_1014), .valid_out(valid_out_1014) );

//Channel 1015
conv_33 #(D, DATA_WIDTH) x1015(.clk(clk), .reset(reset), .valid_in(valid_in_23), .pxl_in(pxl_in_23),
.kernel_00(32'b00111110010011001111010000110010),
.kernel_01(32'b10111100001110010100100110001100),
.kernel_02(32'b10111110010011111001100110101001),
.kernel_03(32'b10111001000100001100010011111011),
.kernel_04(32'b10111110001001101000110010101001),
.kernel_05(32'b00111101001000011011100100010100),
.kernel_06(32'b00111101100101000110001001110100),
.kernel_07(32'b10111111011011000010111001111001),
.kernel_08(32'b00111100111010110110100011101011),
.pxl_out(pxl_out_1015), .valid_out(valid_out_1015) );

//Channel 1016
conv_33 #(D, DATA_WIDTH) x1016(.clk(clk), .reset(reset), .valid_in(valid_in_24), .pxl_in(pxl_in_24),
.kernel_00(32'b00111100001011011000010011101001),
.kernel_01(32'b10111011101111000001101011101000),
.kernel_02(32'b00111111001110000110100000100101),
.kernel_03(32'b00111011010110101001110101010110),
.kernel_04(32'b00111101000000000101010110100111),
.kernel_05(32'b00111101110100000101110101101101),
.kernel_06(32'b00111101000100100111101100010101),
.kernel_07(32'b10111101001101011010010001010100),
.kernel_08(32'b00111110100000010110110111011010),
.pxl_out(pxl_out_1016), .valid_out(valid_out_1016) );

//Channel 1017
conv_33 #(D, DATA_WIDTH) x1017(.clk(clk), .reset(reset), .valid_in(valid_in_25), .pxl_in(pxl_in_25),
.kernel_00(32'b00111101110011011000011111010000),
.kernel_01(32'b10111001111000100110101100010111),
.kernel_02(32'b10111100010100100011100001011010),
.kernel_03(32'b00111110000011110110001110011110),
.kernel_04(32'b00111101101000011011111110101110),
.kernel_05(32'b10111100100110111111011011111011),
.kernel_06(32'b10111111010010000101100110011110),
.kernel_07(32'b00111101011000111001101011000111),
.kernel_08(32'b10111011111010111111000101110001),
.pxl_out(pxl_out_1017), .valid_out(valid_out_1017) );

//Channel 1018
conv_33 #(D, DATA_WIDTH) x1018(.clk(clk), .reset(reset), .valid_in(valid_in_26), .pxl_in(pxl_in_26),
.kernel_00(32'b10111011011110011011000011001000),
.kernel_01(32'b00111110001011100100010110011111),
.kernel_02(32'b10111110000011001000000001011111),
.kernel_03(32'b10111100011111110000110000011100),
.kernel_04(32'b00111011111100100101101010100011),
.kernel_05(32'b10111101000100001100110010000011),
.kernel_06(32'b00111101010001010010000011101100),
.kernel_07(32'b10111100110111000111101100011001),
.kernel_08(32'b10111101000011110010110000100110),
.pxl_out(pxl_out_1018), .valid_out(valid_out_1018) );

//Channel 1019
conv_33 #(D, DATA_WIDTH) x1019(.clk(clk), .reset(reset), .valid_in(valid_in_27), .pxl_in(pxl_in_27),
.kernel_00(32'b00111101111101100111100010010110),
.kernel_01(32'b00111101111010001101100011011100),
.kernel_02(32'b00111100001001101101110010011111),
.kernel_03(32'b00111101010000010101110011011110),
.kernel_04(32'b00111011111001001001110000111010),
.kernel_05(32'b10111100100010111111011000011101),
.kernel_06(32'b10111101000001110100101111110101),
.kernel_07(32'b10111101110000100001110011011100),
.kernel_08(32'b10111100101000101101110110011000),
.pxl_out(pxl_out_1019), .valid_out(valid_out_1019) );

//Channel 1020
conv_33 #(D, DATA_WIDTH) x1020(.clk(clk), .reset(reset), .valid_in(valid_in_28), .pxl_in(pxl_in_28),
.kernel_00(32'b00111101001101011111100101000111),
.kernel_01(32'b10111101100110101101111001111010),
.kernel_02(32'b00111110010101100001000100101000),
.kernel_03(32'b10111101100001101001111000110100),
.kernel_04(32'b10111101101010001001111111000000),
.kernel_05(32'b10111101010110011010001000101110),
.kernel_06(32'b00111101001001110011001111000000),
.kernel_07(32'b10111101000111000110000011010000),
.kernel_08(32'b10111110100001111100101101111100),
.pxl_out(pxl_out_1020), .valid_out(valid_out_1020) );

//Channel 1021
conv_33 #(D, DATA_WIDTH) x1021(.clk(clk), .reset(reset), .valid_in(valid_in_29), .pxl_in(pxl_in_29),
.kernel_00(32'b00111100110101110000000111000001),
.kernel_01(32'b10111101100100111001110001100000),
.kernel_02(32'b00111100101011001110101110010001),
.kernel_03(32'b10111101010010010010011111111000),
.kernel_04(32'b10111110100111000100000010111000),
.kernel_05(32'b10111101100100111000010110110001),
.kernel_06(32'b10111101100010111000111010110010),
.kernel_07(32'b00111011101000101000010110001101),
.kernel_08(32'b00111101000001001111110001001110),
.pxl_out(pxl_out_1021), .valid_out(valid_out_1021) );

//Channel 1022
conv_33 #(D, DATA_WIDTH) x1022(.clk(clk), .reset(reset), .valid_in(valid_in_30), .pxl_in(pxl_in_30),
.kernel_00(32'b00111110100110011001001010101101),
.kernel_01(32'b00111101111101111010110110000000),
.kernel_02(32'b10111100111001011111111111101110),
.kernel_03(32'b00111101010110111000010110111000),
.kernel_04(32'b00111101010110110111011010101001),
.kernel_05(32'b00111101011010010111011011110010),
.kernel_06(32'b10111011000001011100010101100000),
.kernel_07(32'b10111101110101111011011011101110),
.kernel_08(32'b00111110100001011101011001001100),
.pxl_out(pxl_out_1022), .valid_out(valid_out_1022) );

//Channel 1023
conv_33 #(D, DATA_WIDTH) x1023(.clk(clk), .reset(reset), .valid_in(valid_in_31), .pxl_in(pxl_in_31),
.kernel_00(32'b10111110100000010001110110010001),
.kernel_01(32'b10111110100001001111100111000011),
.kernel_02(32'b00111101000111011000010010010010),
.kernel_03(32'b10111111000000001000011101101000),
.kernel_04(32'b00111101110000011011100001001111),
.kernel_05(32'b10111101011100011010100101001010),
.kernel_06(32'b10111101110001110001010010101011),
.kernel_07(32'b00111101100011110000111010100110),
.kernel_08(32'b10111011110001010011110010110000),
.pxl_out(pxl_out_1023), .valid_out(valid_out_1023) );

//Channel 1024
conv_33 #(D, DATA_WIDTH) x1024(.clk(clk), .reset(reset), .valid_in(valid_in_32), .pxl_in(pxl_in_32),
.kernel_00(32'b10111101000000010001010001001111),
.kernel_01(32'b10111110010101110000011110101111),
.kernel_02(32'b10111011110000111011000111011101),
.kernel_03(32'b00111101010001001000010011011010),
.kernel_04(32'b00111101010011011100000001001001),
.kernel_05(32'b10111110110011001111100100111101),
.kernel_06(32'b00111100001000111100100101110001),
.kernel_07(32'b00111110101100001001110011010011),
.kernel_08(32'b10111010100101000010000110101001),
.pxl_out(pxl_out_1024), .valid_out(valid_out_1024) );

endmodule