#include <iostream>
using namespace std;

const int S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;

void state(int& CS, int& NS, int bit, bool& flag) {
    switch (CS) {
        case S0: NS = (bit) ? S1 : S0; break;
        case S1: NS = (bit) ? S2 : S0; break;
        case S2: NS = (bit) ? S2 : S3; break;
        case S3: NS = (bit) ? S4 : S0; break;
        case S4: NS = (bit) ? S2 : S0; break;
    }
    if (CS == S4 && bit == 0) 
        flag = true;
}

bool check_pattern(const string& num) {
    bool flag = false;
    int CS = S0, NS = S0;

    for (char ch : num) {
        int bit = (ch == '1') ? 1 : 0;
        state(CS, NS, bit, flag);
        cout << "CS: " << CS << " | NS: " << NS << " | Bit: " << bit << " | Flag: " << flag << endl;
        CS = NS;
    }
    return flag;
}

int main() {
    string num;
    cout << "Enter a binary string: ";
    cin >> num;

    if (check_pattern(num))
        cout << "Pattern detected!" << endl;
    else
        cout << "Pattern NOT detected!" << endl;

    return 0;
}
