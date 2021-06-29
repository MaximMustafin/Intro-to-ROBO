#include <iostream>

int Reverse(int n, int k = 0)
{
    if(n<10)
    {
        return n + k*10;
    }
    else
    {
        return Reverse(n/10, n%10 + k*10);
    }
}

int main()
{
    int n = 0;
    std::cout<<"Enter a number - ";
    std::cin>>n;
    std::cout<<"Your reversed number = "<<Reverse(n)<<std::endl;
    return 0;
}