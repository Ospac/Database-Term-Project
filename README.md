## Prerequisites

|      Name      | Version  |                    Link                    |
| :------------: | :------: | :----------------------------------------: |
|     Oracle     | 19c     | <https://www.oracle.com/kr/database/technologies/oracle19c-windows-downloads.html/>  |
|   Eclipse EE   | 2021-09R| <https://www.eclipse.org/downloads/packages/release/2021-09/r/eclipse-ide-enterprise-java-and-web-developers/> |
|   Tomcat       | 8.5.83  | <https://tomcat.apache.org/download-80.cgi/> |

&nbsp;

## How to Run
1. Run EclpseEE
    ```
    Create NewProject - Dynamic Web Project

    Project Name is "medicalAccess"

    Set Database Connection Oracle Thin 11

    Add "ojdbc8.jar" to Build Path
    ```

1. Clone and Paste this repository.

   ```bash
   $ cd medicalAccess
   $ git clone https://github.com/Ospac/medicalAccess.git
   ```

1. Create Tables & Insert Values
    ```bash
    sqlplus "team12"/"team12"
    @defauldDB.sql
    ```

1. Run tomcat server on Eclipse

# Pages

## 1. Login.jsp
    아이디, 패스워드 검증
    환자, 의사 선택
    ID, PASSWORD 입력
    
    Patient
    ID : P000002
    PS : 33746441
    
    Doctor
    ID : D000032
    PS : 69644971
       
## 2. Doctor (User-type)
### 2.1 일정 (schedule.jsp)
    예약 일정 확인
### 2.2 예약 내역 (reservationLog.jsp)
    전체 예약 목록 확인
    해당 예약 정보를 클릭해서 상세 정보 확인

### 2.2.1 예약 정보 (reservationInfo.jsp)
    해당 환자의 상세 정보 (이름, 혈액형 ...)및 
    단순 처방만 필요할 경우 처방전 즉시 입력가능.

### 2.3 처방전 (prescriptionLog.jsp)
    전체 처방 목록 확인
    해당 처방 정보를 클릭해서 상세 정보 확인

### 2.3.1 처방 정보 (prescriptionInfo.jsp)
    해당 처방 대상인 환자의 정보 제공
    처방전 내용 제공

### 2.4 내정보 (userInfo.jsp)
    내 정보 확인 및 수정, 로그아웃 가능



    


## 3. Patient (User-type)
### 3.1 홈 (index.jsp)
    진료과목 및 의사 선택으로 예약 및
    약국 검색 가능

### 3.1.1 예약 (doctors.jsp)
    홈에서 선택한 진료 과목에 해당되는 의사(병원)정보 제공

### 3.1.1 예약2 (reservation.jsp)
    전 페이지에서 선택한 의사와의 예약 페이지로 현재 증상 입력

### 3.1.1 예약3 (schedule.jsp)
    현재 해당 의사의 예약일정을 제공하며
    빈 시간대를 선택해 예약가능
    예약 정보는 3.2 예약 내역에서 확인가능

### 3.1.1 약국 (parmacy.jsp)
    주소 선택후 검색시 약국 이름, 주소 목록 제공

### 3.2 예약 내역 (reservationLog.jsp)
    전체 예약 목록 확인
    해당 예약 정보를 클릭해서 상세 정보 확인

### 3.2.1 예약 정보 (reservationInfo.jsp)
    해당 의사의 상세 정보 (의사이름, 병원이름 ...)및 
    입력해둔 증상 확인가능

### 3.3 처방전 (prescriptionLog.jsp)
    전체 처방 목록 확인
    해당 처방 정보를 클릭해서 상세 정보 확인

### 3.3.1 처방 정보 (prescriptionInfo.jsp)
    해당 처방을 내린 의사의 정보 제공
    처방전 내용 제공

### 2.4 내정보 (userInfo.jsp)
    내 정보 확인 및 수정, 로그아웃 가능
