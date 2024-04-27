#!/bin/bash

# 將環境變數的值寫入檔案
echo "$TWEEW_CMD" > /notify.sh
chown 1000:1000 /notify.sh && chmod +x /notify.sh

# 執行 CMD 中的指令
exec "/init"

