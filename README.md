<details markdown="1">
<summary> 목차 </summary>
</br>


 [Deployment Target 12.0](#-deployment-target-12.0)

[라이브러리 정리](#-gitignore)

</details>

## 🍏 Deployment Target 12.0

지원 버전이 13.0 이하라면 sceneDelegate를 사용할 수 없다.

1. sceneDelegate 파일 삭제
2. Info.plist에서 Application Scene Manifest 항목 삭제
3. AppDelegate.swift 편집 (window 변수 만들고 맨위 함수 빼고 모두 제거)

<img width="640" alt="스크린샷 2021-01-21 오후 6 06 42" src="https://user-images.githubusercontent.com/50395024/105628016-934aae00-5e7d-11eb-902d-81baed1a0773.png">



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