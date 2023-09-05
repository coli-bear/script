# script
mac os script file

## kill_port.sh
- 맥에서 IDLE 로 개발하다 보면 가끔 포트가 정상종료하지 않고 IDLE 을 종료하는 경우에 사용
```shell
./kill_port.sh ls # 1024 ~ 65535 사이의 포트의 PID 조회
./kill_port.sh {portnum} # 1024 ~ 65535 사이의 포트 죽이기
```
