#include <string>
#include <sstream>
#include <algorithm>

struct Pos
{
    int x, y;
    Pos(int n) : x(n / 10), y(n % 10) {}
    Pos(int x, int y) : x(x), y(y) {}
    operator int () const { return x * 10 + y; }
    Pos& operator -= (const Pos& other) { x -= other.x; y -= other.y; return *this; }
    friend Pos operator - (Pos lhs, const Pos& rhs) { return lhs -= rhs; }
};

struct Tetromino
{
    int a, b, c, d;

    void normalize()
    {
        Pos ap(a);
        Pos bp(b);
        Pos cp(c);
        Pos dp(d);
        int minx = std::min(std::min(ap.x, bp.x), std::min(cp.x, dp.x));
        int miny = std::min(std::min(ap.y, bp.y), std::min(cp.y, dp.y));
        Pos min(minx, miny);
        a = ap - min;
        b = bp - min;
        c = cp - min;
        d = dp - min;
    }

    bool operator == (const Tetromino& other) const
    {
        return a == other.a && b == other.b && c == other.c && d == other.d;
    }

    bool operator != (const Tetromino& other) const
    {
        return ! (*this == other);
    }
};

std::istream& operator >> (std::istream& in, Tetromino& t)
{
    char c;
    int  p[4];
    in >> p[0] >> c >> p[1] >> c >> p[2] >> c >> p[3];
    std::sort(p, p + 4);
    t.a = p[0];
    t.b = p[1];
    t.c = p[2];
    t.d = p[3];
    return in;
}

std::ostream& operator << (std::ostream& out, const Tetromino& t)
{
    return out << t.a << ", " << t.b << ", " << t.c << ", " << t.d;
}

const Tetromino Ls[] = { { 00, 01, 02, 12 }, { 00, 01, 10, 20 },
                         { 00, 10, 11, 12 }, { 01, 11, 20, 21 },
                         { 00, 01, 11, 21 }, { 00, 01, 02, 10 },
                         { 00, 10, 20, 21 }, { 02, 10, 11, 12 } };
const Tetromino Is[] = { { 00, 10, 20, 30 }, { 00, 01, 02, 03 } };
const Tetromino Ts[] = { { 00, 10, 11, 20 }, { 00, 01, 02, 11 },
                         { 01, 10, 11, 21 }, { 01, 10, 11, 12 } };
const Tetromino Os[] = { { 00, 01, 10, 11 } };
const Tetromino Ss[] = { { 00, 01, 11, 12 }, { 01, 02, 10, 11 },
                         { 01, 10, 11, 20 }, { 00, 10, 11, 21 } };

const Tetromino* const LsEnd = Ls + 8;
const Tetromino* const IsEnd = Is + 2;
const Tetromino* const TsEnd = Ts + 4;
const Tetromino* const OsEnd = Os + 1;
const Tetromino* const SsEnd = Ss + 4;

char getTetrominoType(const std::string& s)
{
    Tetromino          t;
    std::istringstream iss(s);
    iss >> t;
    t.normalize();

    if(std::find(Ls, LsEnd, t) != LsEnd) return 'L';
    if(std::find(Is, IsEnd, t) != IsEnd) return 'I';
    if(std::find(Ts, TsEnd, t) != TsEnd) return 'T';
    if(std::find(Os, OsEnd, t) != OsEnd) return 'O';
    if(std::find(Ss, SsEnd, t) != SsEnd) return 'S';

    return '-';
}
