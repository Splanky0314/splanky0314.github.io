---
layout: post
title: "[C/C++] [BOJ1325 효율적인 해킹] Cycle 항상 조심😅"
subheading: 
author: Daeun
categories: Problem_Solving
banner: https://cdn.jsdelivr.net/gh/splanky0314/CDN/Problem_Solving/2024-07-02-Graph_Cycle/1.jpg
tags: BOJ boj1325 BFS DFS 탐색 그래프 graph dp 메모제이션
---

## 메모제이션, dp를 활용할 때는 cycle이 존재하는지 확인하자

실버라고 얕보고 있었는데, 생각할 거리가 있는 문제였다..

![BOJ1325 효율적인 해킹](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Problem_Solving/2024-07-02-Graph_Cycle/0.png)

[https://www.acmicpc.net/problem/1325](https://www.acmicpc.net/problem/1325)

시간초과가 자꾸,,,

'내 제출' 보니까 3달 전에도 시도했다가 시간 초과가 났던 문제였다.

심지어 풀이 방법이 어쩜 이리 똑같아..

## 1차 시도: dfs -> 시간 초과

문제까지 잘못 읽고 풀어서 ans 처리랑 출력 부분도 틀림....

1~n까지의 노드에 대해 dfs를 시행하는 방법으로 시도했습니다.

하지만 2% 시간초과...

```cpp
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
using ll = long long;

vector<int> g[10001];
bool v[10001]; 
int cnt;

void dfs(int x) {
	cnt++;
	v[x] = 1;
	for(int y: g[x]) {
		if(!v[y]) {
			dfs(y);
		}
	}
	v[x] = 0;
}

int main() {
    ios::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

	int n, m, a, b;
	vector<pair<int,int>> ans;
	cin >> n >> m;
	for(int i=0; i<m; i++) {
		cin >> a >> b;
		g[b].push_back(a);
	}

	for(int i=1; i<=n; i++) {
		cnt = 0;
		dfs(i);
		if(cnt != 1) {
			ans.push_back({cnt, i});
		}
	}

	sort(ans.begin(), ans.end());
	for(int i=0; i<ans.size(); i++) {
		if(g[i].size() != 0)
			cout << ans[i].second << " ";
	}
}
```
 

## 2차 시도: 메모제이션(dp) -> 시간 초과

memo 배열을 이용해서 해당 `memo[기준노드] = 기준노드를 해킹했을 때 해킹가능한 컴퓨터의 수` 꼴로 저장하여 시간 효율을 높였습니다.

하지만 결과는 똑같이 2% 시간 초과....

실버 1을 이렇게 못 풀고 있다는 사실에 현타 한 번 느끼고...;

```cpp
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
using ll = long long;

vector<int> g[10001];
int memo[10001]; // cnt
int cnt;

int dfs(int x) {
	bool flag = 1;
	if(memo[x]) {
		return memo[x];
	}

	for(int y: g[x]) {
		memo[x] += dfs(y);
		flag = 0;
	}
	if(flag) return memo[x] = 1;
	return ++memo[x];
}

int main() {
    ios::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

	int n, m, a, b;
	vector<int> ans;
	cin >> n >> m;
	for(int i=0; i<m; i++) {
		cin >> a >> b;
		g[b].push_back(a);
	}

	int result, max = -1;
	for(int i=1; i<=n; i++) {
		result = dfs(i);
		cout << i << ": " << result << endl;
		if(max == -1 || max < result) {
			max = result;
		}
	}

	for(int i=1; i<=n; i++) {
		if(memo[i] == max) {
			ans.push_back(i);
		}
	}

	sort(ans.begin(), ans.end());
	for(int i=0; i<ans.size(); i++) {
		cout << ans[i] << " ";
	}
}
```

## 문제 발견: 그래프에 cycle이 존재한다면?

2차 시도의 코드를 보면 해당 노드와 연결된 다른 노드가 없는 경우, return 1을 하게 되어 있습니다. 이게 종료 조건이죠.

**하지만..! 만약 그래프에 cycle이 존재한다면?!** 

![BOJ1325 효율적인 해킹](https://cdn.jsdelivr.net/gh/splanky0314/CDN/Problem_Solving/2024-07-02-Graph_Cycle/1.jpg)

**계속 간선을 따라서 노드가 존재하므로 종료 조건에 도달하지 않고 무한 루프에 빠지게 됩니다!!!!!!!!!!** (으아으어악)

방문 처리를 제대로 하지 않았기 때문이죠^^

(왜 visited 배열 역할까지 memo가 하게 해야겠다고 생각하고 아무 처리를 안한거지..?)