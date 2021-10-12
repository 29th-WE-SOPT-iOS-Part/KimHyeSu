# Week01-Seminar

## App State 변화 (앱의 상태 변화)
![](https://images.velog.io/images/hyesuuou/post/29b722e6-9a07-410c-8867-2aa2bedc4b66/image.png) 

### state
#### Inactive
- 앱이 전면에서 실행중이지만, 다른 기능을 수행중
- 사용자 입력이나 이벤트를 받아들일 준비가 되지 않음
ex) 전화를 걸었을 때, SMS 메시지를 받는 순간

#### Active
- 앱이 전면에서 실행중
- 이벤트를 받을 수 있는 상태

#### Background
- 앱이 백그라운드에 있지만, 여전히 코드가 실행중
- 파일 다운로드, 업로드, 연산처리 등 여분의 실행시간이 필요할 경우, 특정 시간동안 이 상태로 남아있기도 한다.

#### Suspended
- 백그라운드 상태에서 활동을 멈춘 상태
- 빠른 재실행을 위해 메모리에 적재된 상태 -> But 실제로 동작하진 않음
- 메모리가 부족할때 시스템이 강제종료됨

<br>

## View Controller lifeCycle
![](https://images.velog.io/images/hyesuuou/post/65f49c84-12cd-41e3-8019-e78951bffa6a/image.png) ![](https://images.velog.io/images/hyesuuou/post/c3d064b7-10f5-4e73-a424-9a53fc8e7b47/image.png)

#### func viewDidLoad()
- 뷰 계층이 메모리에 로드된 직후에 호출됨
- 뷰의 초기화 작업을 하기 좋음
- 메모리에 처음 로딩될 때 **딱 1번 호출됨**
- 뷰가 사라지지 않는 이상 재호출 x

#### func viewWillAppear(_ animated: Bool)
- 뷰가 뷰 계층에 추가된 후, 화면에 표시되기 직전에 호출
- 뷰의 추가적인 초기화 작업을 하기 좋음
- 다른 뷰로 이동했다가 되돌아오면 재호출됨
- 화면이 나타날때마다 수행해야 하는 작업을 하기 좋음

#### func viewDidAppear(_ animated: Bool)
- 뷰가 뷰 계층에 추가되어 화면이 표시되면 호출됨
- 뷰를 나타내는 것과 관련한 추가적인 작업을 하기 좋음

#### func viewWillDisappear(_ animated: Bool)
- 뷰가 뷰 계층에서 사라지기 직전에 호출됨
- 뷰가 생성된 뒤 발생한 변화를 이전으로 되돌리기 좋음

#### func viewDidDisappear(_ animated: Bool)
- 뷰가 뷰 계층에서 사라진 후 호출됨
- 뷰를 숨기는 것과 관련한 추가적인 작업을 하기 좋음
- 시간이 오래 걸리는 작업은 하지 않는 것이 좋음



