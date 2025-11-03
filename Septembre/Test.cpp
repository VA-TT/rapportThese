#include <iomanip>
#include <iostream>
#include <algorithm>

int main()
{
    std::cout << std::setprecision(17);

    constexpr double d1{1.0};
    constexpr double d2{0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1 + 0.1};
    std::cout << std::boolalpha << (d2 == 1.0) << '\n'; // true

    constexpr double d3{100.0 - 99.99}; // 0.01
    constexpr double d4{10.0 - 9.99};   // 0.01

    if (d3 == d4)
        std::cout << "d3 == d4" << '\n';
    else if (d3 > d4)
        std::cout << "d3 > d4" << '\n';
    else if (d3 < d4)
        std::cout << "d3 < d4" << '\n';

    std::cout << std::boolalpha << (0.3 == 0.2 + 0.1) << '\n'; // true

    return 0;
}