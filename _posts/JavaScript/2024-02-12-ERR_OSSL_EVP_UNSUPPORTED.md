---
layout: post
title: "[npm 에러] code: 'ERR_OSSL_EVP_UNSUPPORTED' 해결 방법"
subheading: 
author: Daeun
categories: JavaScript
banner:
tags: npm node.js npx NPM JavaScript JS React React.js django drf django_rest_framework

---

## ERROR 내용

github에서 react 관련 레포를 clone하고 `npm start`를 입력했더니 아래와 같은 에러가 발생했습니다.

![ERR_OSSL_EVP_UNSUPPORTED](https://cdn.jsdelivr.net/gh/splanky0314/CDN/JavaScript/2024-02-12-ERR_OSSL_EVP_UNSUPPORTED/0.png)

### 에러 메세지 전체

```
Starting the development server...

Error: error:0308010C:digital envelope routines::unsupported
    at new Hash (node:internal/crypto/hash:68:19)
    at Object.createHash (node:crypto:138:10)
    at module.exports (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\util\createHash.js:135:53)
    at NormalModule._initBuildHash (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:417:16)
    at handleParseError (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:471:10)
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:503:5
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:358:12
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:373:3
    at iterateNormalLoaders (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:214:10)
    at iterateNormalLoaders (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:221:10)
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:236:3
    at runSyncOrAsync (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:130:11)
    at iterateNormalLoaders (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:232:2)
    at Array.<anonymous> (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:205:4)
C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\react-scripts\scripts\start.js:19
  throw err;
Starting the development server...

Error: error:0308010C:digital envelope routines::unsupported
    at new Hash (node:internal/crypto/hash:68:19)
    at Object.createHash (node:crypto:138:10)
    at module.exports (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\util\createHash.js:135:53)
    at NormalModule._initBuildHash (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:417:16)
    at handleParseError (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:471:10)
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:503:5
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:358:12
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:373:3
    at iterateNormalLoaders (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:214:10)
    at iterateNormalLoaders (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:221:10)
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:236:3
    at runSyncOrAsync (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:130:11)
    at iterateNormalLoaders (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:232:2)
    at Array.<anonymous> (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:205:4)
    at Storage.finished (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\enhanced-resolve\lib\CachedInputFileSystem.js:55:16)
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\enhanced-resolve\lib\CachedInputFileSystem.js:91:9
C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\react-scripts\scripts\start.js:19
  throw err;
  ^

Error: error:0308010C:digital envelope routines::unsupported
    at new Hash (node:internal/crypto/hash:68:19)
    at Object.createHash (node:crypto:138:10)
    at module.exports (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\util\createHash.js:135:53)
    at NormalModule._initBuildHash (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:417:16) 
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:452:10
Starting the development server...

Error: error:0308010C:digital envelope routines::unsupported
    at new Hash (node:internal/crypto/hash:68:19)
    at Object.createHash (node:crypto:138:10)
    at module.exports (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\util\createHash.js:135:53)
    at NormalModule._initBuildHash (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:417:16)
    at handleParseError (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:471:10)
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:503:5
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:358:12
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:373:3
    at iterateNormalLoaders (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:214:10)
    at iterateNormalLoaders (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:221:10)
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:236:3
    at runSyncOrAsync (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:130:11)
    at iterateNormalLoaders (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:232:2)
    at Array.<anonymous> (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:205:4)
    at Storage.finished (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\enhanced-resolve\lib\CachedInputFileSystem.js:55:16)
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\enhanced-resolve\lib\CachedInputFileSystem.js:91:9
C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\react-scripts\scripts\start.js:19
  throw err;
  ^

Error: error:0308010C:digital envelope routines::unsupported
    at new Hash (node:internal/crypto/hash:68:19)
    at Object.createHash (node:crypto:138:10)
    at module.exports (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\util\createHash.js:135:53)
    at NormalModule._initBuildHash (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:417:16)
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:452:10
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\webpack\lib\NormalModule.js:323:13
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:367:11
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:233:18
    at context.callback (C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\loader-runner\lib\LoaderRunner.js:111:13)
    at C:\Programing\2024\Simple-DRF-React-Blog\frontend\node_modules\babel-loader\lib\index.js:55:103 {
  opensslErrorStack: [ 'error:03000086:digital envelope routines::initialization error' ],
  library: 'digital envelope routines',
  reason: 'unsupported',
  code: 'ERR_OSSL_EVP_UNSUPPORTED'
}

Node.js v20.11.0
```

## `code: 'ERR_OSSL_EVP_UNSUPPORTED'` 해결 방법

1. `package.json` 파일을 열어줍니다. 
			![ERR_OSSL_EVP_UNSUPPORTED](https://cdn.jsdelivr.net/gh/splanky0314/CDN/JavaScript/2024-02-12-ERR_OSSL_EVP_UNSUPPORTED/1.png)

2. "scripts" 부분을 찾고 "start"와 "build"를 아래와 같이 수정해 줍니다.
	![ERR_OSSL_EVP_UNSUPPORTED](https://cdn.jsdelivr.net/gh/splanky0314/CDN/JavaScript/2024-02-12-ERR_OSSL_EVP_UNSUPPORTED/2.png)

	복붙하세요)
	```json
	"scripts": {
		"start": "react-scripts --openssl-legacy-provider start",
		"build": "react-scripts --openssl-legacy-provider build",
		"test": "react-scripts test",
		"eject": "react-scripts eject"
	},
	```
	
3. 다시 `npm start`를 해줍시다.

	![ERR_OSSL_EVP_UNSUPPORTED](https://cdn.jsdelivr.net/gh/splanky0314/CDN/JavaScript/2024-02-12-ERR_OSSL_EVP_UNSUPPORTED/3.png)

## 왜 에러가 발생했을까..?

The error  **ERR_OSSL_EVP_UNSUPPORTED**  has been mentioned in the  [release notes](https://github.com/nodejs/node/blob/master/doc/changelogs/CHANGELOG_V17.md#17.0.0)  for Node.js 17.

If you hit an  **ERR_OSSL_EVP_UNSUPPORTED**  error in your application with Node.js 17, it’s likely that your application or a module you’re using is attempting to use an algorithm or key size which is no longer allowed by default with OpenSSL 3.0. A command-line option,  `--openssl-legacy-provider`, has been added to revert to the legacy provider as a temporary workaround for these tightened restrictions.

라고 합니다.

[How To Fix ERR_OSSL_EVP_UNSUPPORTED In React JS Application](https://roytuts.com/how-to-fix-err_ossl_evp_unsupported-in-react-js-application/)