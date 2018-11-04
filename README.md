# ToDo
할 일 작성/수정/삭제와 일의 마감기한을 관리할 수 있습니다.


#### 정보
* ToDO 사이트는 ruby 2.3.7 / rails 5.2.1 를 기준으로 만들어졌습니다.
* 로그인하지 않으면 사용이 불가합니다.
* 마감기한을 설정할 수도 있습니다.
* 마감기한이 지난 일은 따로 보여집니다.



#### 설치방법
1. git 저장소를 로컬에 복사합니다.
        
        $ git clone https://github.com/KKambi/Todolist

2. Todolist 폴더에 들어가 젬을 설치하고, DB를 구축합니다.

        $ cd Todolist
        $ bundle install
        $ rake db:migrate

3. 서버를 구동합니다.

        $ rails s
