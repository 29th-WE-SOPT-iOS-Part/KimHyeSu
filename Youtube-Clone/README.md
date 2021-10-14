# 29th SOPT iOS 과제 - Youtube Clone

## Week01

![image](https://user-images.githubusercontent.com/68391767/137289230-5fff229f-db63-44af-a927-31785331ddab.png)
![image](https://user-images.githubusercontent.com/68391767/137289392-ff9a533d-f3b6-43e7-9e54-ad76686d92c4.png)

### 실행영상

- [🍎 과제 Pull Request (바로가기!)](https://github.com/29th-WE-SOPT-iOS-Part/KimHyeSu/pull/4)
- [✨ 코드베이스 도전 Pull Request (바로가기!)](https://github.com/29th-WE-SOPT-iOS-Part/KimHyeSu/pull/8)


<img src="https://user-images.githubusercontent.com/68391767/137344268-ee30853d-57cf-43b3-9087-6d1016ab0a66.gif" width="300"><img src="https://user-images.githubusercontent.com/68391767/137344409-e21a6815-08e8-41f9-a089-38416dd3f624.gif" width="300">


✅ UI 구성

✅ 화면전환 present, push

✅ 데이터 전달

✅ (도전과제) textfield 모두 채워지면 버튼 활성화

✅ (도전과제) 회원가입 화면에서 비밀번호 표시 버튼 구현

<br>

### 새롭게 알게된 점 (with 금잔디파)

#### 💎 Bool - toggle로 값 전환하기

**원래 코드**

```swift
pwTextField.isSecureTextEntry = !pwTextField.isSecureTextEntry
```

**개선한 코드**

```swift
pwTextField.isSecureTextEntry.toggle()
``` 

#### 💎 hasText 메서드

텍스트 항목 객체에는 내부에 텍스트가 있는지(true 리턴) 없는지(false)를 판단할 수 있는 메서드가 있다.

 **원래 코드**

```swift
if nameTextField.text != "",
	 emailTextField.text != "",
	 pwTextField.text != "" {
		  nextButton.backgroundColor = .systemBlue
} else {
	nextButton.backgroundColor = .lightGray
}
```

**개선한 코드**

```swift
let hasTextInAllTextFields: Bool = nameTextField.hasText && emailTextField.hasText && pwTextField.hasText

nextButton.isEnabled = hasTextInAllTextFields
nextButton.backgroundColor = hasTextInAllTextFields ? .systemBlue : . lightGray
```

그리고 이 경우는 isEnable의 값이 조건문의 값고 같기 때문에 위와같이 쓰는 것이 가능하다.
또 삼항 연산자를 사용하면 더 간단히 표현할 수 있다.



#### 💎 foreach문 사용하기

textfield에 addTarget을 해주는 과정에서 반복되는 코드가 굉장히 거슬렸는데, foreach문을 사용하면 더 깔끔하게 표현할 수 있다는 것을 알게 되었다.

 **원래 코드**

```swift
nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
pwTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
```

**개선한 코드**

```swift
[nameTextField, contactTextField, passwordTextField].forEach {
    $0?.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
}
```

