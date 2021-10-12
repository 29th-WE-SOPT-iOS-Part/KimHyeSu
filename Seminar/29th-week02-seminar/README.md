# Week02-Seminar

## Safe Area

- 원래는 TV에서 나온 개념, 아이폰은 X부터 나온 개념
- 상단 노치와 하단 홈바에는 콘텐츠가 제대로 표시되지 않기 때문에, 이 부분을 제외하고 콘텐츠가 안전하게 표시될 수 있는 영역을 말함
- 필수 콘텐츠의 노출을 보장할 수 있는 영역
- 컨텐츠가 상태바, 네비게이션바, 툴바, 탭바를 가리는 것을 방지하는 영역
- 주의점: Status Bar / Home Indicator 는 기기마다 크기 다를 수 있음 (고정값 사용하지 말것)

![](https://images.velog.io/images/hyesuuou/post/e27dfec5-84c0-4d09-8ad2-edbc35c00e47/image.png)

<br>

## Info.plist 파일?
- **Information Property List Files**
- 실행 패키지에 관한 필수 설정 정보가 포함된 구조화된 텍스트 파일
- 유니코드 UTF-8 인코딩, XML 사용
- Key, value로 구성된 딕셔너리 형태
- 시스템은 작성된 내용을 바탕으로 **앱과 앱의 설정**을 가져옴

<br>

## Instrinsic contents size
[🔥 28th 정리 link](https://github.com/28th-BE-SOPT-iOS-Part/KimHyeSoo/tree/main/Seminar/SOPT-seminar-2#intrinsic-size)

![](https://images.velog.io/images/hyesuuou/post/4a894719-3268-4942-aaf4-4c5d03e38987/image.png)
- 컨텐츠의 본질적인 크기 
- UILabel, UIButton 등은 text와 font size를 설정해 줄 수 있으므로, 컨텐츠의 본질적인 크기가 존재함
- 자신의 크기를 결정할 수 있음
-> 레이아웃을 잡을 때 위치만 간단히 잡아줘도 에러 x

<br>

## Tabbar 코드로 구현하기
``` swift
class ~~~ : UITabBarContoller {

func setTabbar() {
	guard let vc1 = self.storyboard?.instantiateViewController(identifier: "vc1"),
    	let vc2 = self.storyboard?.instantiateViewController(identifier: "vc2")
        else { return }

	vc1.tabBarItem.title = "Home"
    vc1.tabBarItem.image = UIImage(systemName: "house")
    vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
    
    vc2.tabBarItem.title = "Profile"
    vc2.tabBarItme.image = UIImage(systemName: "person")
    vc2.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
    
    setViewControllers([vc1, vc2], animated: true)
}
}
```

- title 설정 -> `.tabBarItem.title`
- 아이콘 image 설정 - `.tabBarItem.image`
- 아이콘 선택시 image 설정 - `.tabBarItem.selectedImage`
- UITabBarController의 setViewControllers 메서드를 사용해 Tabbar의 view Controller 구성 (방법: 파라미터로 ViewController 배열을 전달한다.)
