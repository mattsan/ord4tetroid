
#include <gtest/gtest.h>
#include <string>

char getTetrominoType(const std::string& s);

#define test(A, E) ASSERT_EQ(E, getTetrominoType(A))

TEST(TetrominoTest, test1)
{
    /* #1*/ test("55, 55, 55, 55", '-');
    /* #2*/ test("07, 17, 06, 05", 'L');
    /* #3*/ test("21, 41, 31, 40", 'L');
    /* #4*/ test("62, 74, 73, 72", 'L');
    /* #5*/ test("84, 94, 74, 75", 'L');
    /* #6*/ test("48, 49, 57, 47", 'L');
    /* #7*/ test("69, 89, 79, 68", 'L');
    /* #8*/ test("90, 82, 91, 92", 'L');
    /* #9*/ test("13, 23, 03, 24", 'L');
    /*#10*/ test("24, 22, 25, 23", 'I');
    /*#11*/ test("51, 41, 21, 31", 'I');
    /*#12*/ test("64, 63, 62, 65", 'I');
    /*#13*/ test("49, 69, 59, 79", 'I');
    /*#14*/ test("12, 10, 21, 11", 'T');
    /*#15*/ test("89, 99, 79, 88", 'T');
    /*#16*/ test("32, 41, 43, 42", 'T');
    /*#17*/ test("27, 16, 36, 26", 'T');
    /*#18*/ test("68, 57, 58, 67", 'O');
    /*#19*/ test("72, 62, 61, 71", 'O');
    /*#20*/ test("25, 24, 15, 14", 'O');
    /*#21*/ test("43, 54, 53, 42", 'S');
    /*#22*/ test("95, 86, 76, 85", 'S');
    /*#23*/ test("72, 73, 84, 83", 'S');
    /*#24*/ test("42, 33, 32, 23", 'S');
    /*#25*/ test("66, 57, 67, 58", 'S');
    /*#26*/ test("63, 73, 52, 62", 'S');
    /*#27*/ test("76, 68, 77, 67", 'S');
    /*#28*/ test("12, 11, 22, 01", 'S');
    /*#29*/ test("05, 26, 06, 25", '-');
    /*#30*/ test("03, 11, 13, 01", '-');
    /*#31*/ test("11, 20, 00, 21", '-');
    /*#32*/ test("84, 95, 94, 86", '-');
    /*#33*/ test("36, 56, 45, 35", '-');
    /*#34*/ test("41, 33, 32, 43", '-');
    /*#35*/ test("75, 94, 84, 95", '-');
    /*#36*/ test("27, 39, 28, 37", '-');
    /*#37*/ test("45, 34, 54, 35", '-');
    /*#38*/ test("24, 36, 35, 26", '-');
    /*#39*/ test("27, 27, 27, 27", '-');
    /*#40*/ test("55, 44, 44, 45", '-');
    /*#41*/ test("70, 73, 71, 71", '-');
    /*#42*/ test("67, 37, 47, 47", '-');
    /*#43*/ test("43, 45, 41, 42", '-');
    /*#44*/ test("87, 57, 97, 67", '-');
    /*#45*/ test("49, 45, 46, 48", '-');
    /*#46*/ test("63, 63, 52, 72", '-');
    /*#47*/ test("84, 86, 84, 95", '-');
    /*#48*/ test("61, 60, 62, 73", '-');
    /*#49*/ test("59, 79, 69, 48", '-');
    /*#50*/ test("55, 57, 77, 75", '-');
}
