class NextDay {
  bool namNhuan(int year) {
    return ((year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0)));
  }

  int ngayTrongThang(int month, int year) {
    int day = -1;

    // month [1,2,3..,12]
    switch (month) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        {
          day = 31;
          break;
        }
      case 2:
        {
          namNhuan(year)
              ? day = 29
              : day = 28; // la nam nhuan thi 29 nguoc lai la 28
          break;
        }
      default:
        {
          day = 30;
          break;
        }
    }

    return day;
  }

  String ngayKeTiep(int year, int day, int month) {
    if (day < 1 || day > 31) return 'Ngày không hợp lệ';
    if (month < 1 || month > 12) return 'Tháng không hợp lệ';
    if (year < 1900) return 'Năm không hợp lệ';
    // tao bien ket qua
    //
    String result = '';
    int ngayhople =
        ngayTrongThang(month, year); // kiem tra xem tinh hop le cua ngay
    if (day > ngayhople) {
      // 29/2/2003 > 28/2/2003 => khong hop le
      return 'Ngày không hợp lệ';
    }
    day++;

    if (day > ngayhople) {
      // 31 > ngày hợp lệ của tháng thì ngày về 1 và tháng + 1

      day = 1;
      month++;
      if (month > 12) {
        month = 1;
        year++;
      }
    }
    result = 'ngày tiếp theo là : $day/$month/$year';

    return result;
  }
}
