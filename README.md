# Mackerel API 取得データ簡易プレビュー

大きな流れとしては

+ rake タスクでサービス、またはホスト単位でAPIからデータ取得。
+ rails server でデータプレビュー

## Usage

https://mackerel.io/orgs/xxx?tab=apikeys

でAPIキーを追加。(読み込み権限で可)

```shell
bin/setup

vi .env

MACKEREL_APIKEY='xxxxx'

# どちらかを指定
TARGET_HOST_ID='wanted_host_id'
TARGET_SERVICE_NAME='wanted_service_name'

# , 区切りで欲しい期間を指定
TARGET_TIME_RANGE_1='2020-6-30 10:00:00, 2020-7-3 10:00:00'
TARGET_TIME_RANGE_2='2020-6-30 10:00:00, 2021-5-1 10:00:00'
...

# サービス、またはホスト単位でAPIからデータ取得
# TARGET_SERVICE_NAME
bundle exec rake mk:service_metrics
# TARGET_HOST_ID
bundle exec rake mk:host_metrics

# プレビュー用サーバー起動
bundle exec rails s -b 0.0.0.0
```

http://localhost:3000/
