# AWS Cloud Development Kit (CDK) for LocalStack

This is a fork of the [AWS CDK](https://github.com/aws/aws-cdk) library which provides simple configurations/extensions to run CDK scripts against local APIs provided by [LocalStack](https://github.com/localstack/localstack).

## Quick Installation

The `cdklocal` command line is published as an [npm library](https://www.npmjs.com/package/aws-cdk-local):
```
$ npm install aws-cdk-local
...
$ cdklocal --version
1.64.1
```

## Offline/Local Mode

This modified version of CDK creates the stack against your local aws environment emulated with LocalStack by setting the endpoint for all the SDK services to `http://localhost:4566`. By default, offline mode is enabled but can be disabled by using `--offline=false` argument.

## Deploying a Sample App

The CDK command line ships with a sample app generator to run a quick test for getting started:
```
$ mkdir /tmp/test; cd /tmp/test
$ cdklocal init sample-app --language=javascript
...
```

Make sure that LocalStack is installed and started up with the required services:
```
$ SERVICES=serverless,sqs,sns localstack start
```

Then deploy the sample app against the local APIs via the `cdklocal` command line:
```
$ cdklocal deploy
...
Do you wish to deploy these changes (y/n)? y
...
Stack ARN:
arn:aws:cloudformation:us-east-1:000000000000:stack/TestStack/e3debc0a-311e-4968-8230-ed78f89cb614
```

Once the deployment is done, you can inspect the created resources via the [`awslocal`](https://github.com/localstack/awscli-local) command line:
```
$ awslocal sns list-topics
{
    "Topics": [
        {
            "TopicArn": "arn:aws:sns:us-east-1:000000000000:TestStack-TestTopic339EC197-79F43WWCCS4Z"
        }
    ]
}
```

## Credits

* Big Kudos to [@lfantone](https://github.com/lfantone) who originally started this project [here](https://github.com/lfantone/aws-cdk).

## License

The AWS CDK is distributed under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).
