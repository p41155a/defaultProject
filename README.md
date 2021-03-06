<details markdown="1">
<summary> 목차 </summary>
</br>


 [Deployment Target 12.0](#-deployment-target-12.0)

[라이브러리 정리](#-gitignore)

[Extension](#-extension)

</details>



## 🍏 Deployment Target 12.0

지원 버전이 13.0 이하라면 sceneDelegate를 사용할 수 없다.

1. sceneDelegate 파일 삭제
2. Info.plist에서 Application Scene Manifest 항목 삭제
3. AppDelegate.swift 편집 (window 변수 만들고 맨위 함수 빼고 모두 제거)

<img width="640" alt="스크린샷 2021-01-21 오후 6 06 42" src="https://user-images.githubusercontent.com/50395024/105628016-934aae00-5e7d-11eb-902d-81baed1a0773.png">



---



## 🍏 .gitignore

* `.gitignore` 파일을 추가하기 전에 commit을 했다면?

```
git rm -r --cached [파일명]
```



### references

* https://github.com/github/gitignore : github 공식 레포

* https://gitignore.io : 간단하게 gitignore 파일을 만들어주는 사이트



## 🍏 SwiftLint

### SwiftLint 적용하기

* swiftLint 라이브러리 다운 후
* `Build Phases`에서`New Run Script Phases` 클릭하여 아래의 코드 추가

```swift
if which swiftlint >/dev/null; then
    swiftlint
else
    echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
```

* 방금 추가한 스텝의 위치를 `Compile Sources` 위로 이동한다.



### references

* https://github.com/realm/SwiftLint





## 🍏 SwiftGen

* SwiftGen: 문자열을 사용할 때 생길 수 있는 오타 위험을 피할 수 있고, asset을 사용할 때 존재하지 않는 asset 이름을 적는 위험을 피할 수 있음

### SwiftGen 적용하기

* cocoapod에 `pod 'SwiftGen', '~> 6.0'`를 추가후 설치
* `New Run Script Phases` 클릭하여 아래의 코드 추가

```swift
if [[ -f "${PODS_ROOT}/SwiftGen/bin/swiftgen" ]]; then
   swiftgen xcassets "${SRCROOT}/${TARGETNAME}/Resource/Assets.xcassets" -t swift4 -o 		 "${SRCROOT}/${TARGETNAME}/Resource/SwiftGen/Asset.swift"
else
  echo "warning: SwiftGen is not installed. Run 'pod install --repo-update' to install it."
fi
```

Resource 디렉토리의 Assets라는 이름의 xcassets라는 파일을 asset.swift라는로 만들겠다라는 뜻입니다.

`homebrew`로 설치 했다면

```
swiftgen xcassets "${SRCROOT}/${TARGETNAME}/Resource/Assets.xcassets" -t swift4 -o "${SRCROOT}/${TARGETNAME}/Resource/SwiftGen/Asset.swift"
```

이렇게 하면 되고 

```
swiftgen xcassets --param enumName=Colors "${SRCROOT}/${TARGETNAME}/Resource/Assets.xcassets" -t swift4 -o "${SRCROOT}/${TARGETNAME}/Resource/SwiftGen/Asset.swift"
```

로 enum이름을 지정할 수 도 있습니다.

- 그 후 build하면 xcode에는 없고 파일에만 생깁니다. 드래그 드롭으로 xcode에 파일을 추가시켜 주세요.



### references

- https://github.com/SwiftGen/SwiftGen



---



## 🍏 Extension

### Storyboard

- 테스트를 위해 View 두개를 만들고 하나에 Navigation을 연결합니다. (Editor - Embed in - Navigation Controller)
- Stroyboard의 이름과 code의 파일 이름은 같게 한다

![스크린샷 2021-01-25 오전 11 08 16](https://user-images.githubusercontent.com/50395024/105653798-0ac12180-5f00-11eb-9619-d0d51fe689b1.png)

- Storyboarded protocol을 만들어 UIViewController에 protocol을 채택합니다



#### 사용법

```swift
let viewcontroller = TableSampleViewController.instantiate()
self.navigationController?.pushViewController(viewcontroller, animated: true)
```

참고 블로그: https://swieeft.github.io/2021/01/21/SimpleToUseTableViewCell.html





### TableViewCell

- 클래스명, nibname, id를 동일하게 설정한다.

![스크린샷 2021-01-25 오후 12 51 42](https://user-images.githubusercontent.com/50395024/105660628-c8531100-5f0e-11eb-9b15-37a2baa3f071.png)

![스크린샷 2021-01-25 오후 12 50 44](https://user-images.githubusercontent.com/50395024/105660623-c721e400-5f0e-11eb-96cd-76fbfb9fd488.png)

- TableViewCelled을 만들어 UITableViewCell에 protocol을 채택합니다



#### 사용법

```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  return TableSampleTableViewCell.dequeueReusableCell(tableView: tableView)
}
```

참고 블로그: https://swieeft.github.io/2021/01/21/SimpleToUseTableViewCell.html



## AlertView

원하는 View를 xib 파일로 만든 후

![스크린샷 2021-01-26 오후 12 09 10](https://user-images.githubusercontent.com/50395024/106377411-2a64b800-63e0-11eb-93ee-d9762b2a2f6f.png)

![스크린샷 2021-01-26 오후 1 34 10](https://user-images.githubusercontent.com/50395024/106377414-2df83f00-63e0-11eb-9ce5-a5f0adbf3e5e.png)

위와 같이 file's Owner에 Controller에 연결하고 View와 연결하고 나머지 원하는 outlet들을 연결하고 action을 연결하여

기능을 만듭니다.
