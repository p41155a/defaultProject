<details markdown="1">
<summary> 목차 </summary>
</br>


 [Deployment Target 12.0](#Deployment-Target-12.0)

</details>

## Deployment Target 12.0

지원 버전이 13.0 이하라면 sceneDelegate를 사용할 수 없다.

1. sceneDelegate 파일 삭제
2. Info.plist에서 Application Scene Manifest 항목 삭제
3. AppDelegate.swift 편집 (window 변수 만들고 맨위 함수 빼고 모두 제거)

![스크린샷 2021-01-21 오후 6.06.42](/Users/yoojin/Desktop/스크린샷 2021-01-21 오후 6.06.42.png)







