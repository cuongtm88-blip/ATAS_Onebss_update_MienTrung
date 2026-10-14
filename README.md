# ATS OneBSS — Miền Trung

Bản ATS OneBSS dành riêng cho Miền Trung trên Windows x64. Cấu hình nhân sự,
quy tắc phân bổ, Google Sheet và dữ liệu chạy của miền này tách biệt với các miền
khác.

## Tạo gói Windows

Trên Windows, cài `uv` rồi chạy:

```powershell
.\scripts\build_app.ps1
```

Gói được tạo trong `dist/ATS-OneBSS`. Các tag `v*` tạo Windows release tự động.

Hai dịch vụ `Thoại quốc tế` và `Sponsored Roaming` được cân bằng giữa năm nhân sự theo tải hiện tại; phiếu không cộng điểm và không ghi vào Google Sheet theo quy tắc trong workbook.
