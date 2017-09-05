topological-sort-d
====
[![Dub version][dub-version]][dub-version-url]
[![Dub downloads][dub-downloads]][dub-downloads-url]
[![License][license-badge]][license-badge-url]


## Description

Perform topological sorting.

## Usage

```
import topologicalsort;

auto verticesList = [[0, 1], [0, 2], [2, 3], [1, 3]];
auto result = verticesList.topologicalSort; // [0, 1, 2, 3]
```
[dub-version]:       https://img.shields.io/dub/v/topological-sort.svg
[dub-version-url]:   https://code.dlang.org/packages/topological-sort
[dub-downloads]:     https://img.shields.io/dub/dt/topological-sort.svg
[dub-downloads-url]: https://code.dlang.org/packages/topological-sort
[license-badge]:     https://img.shields.io/badge/License-BSL%20v1.0-blue.svg
[license-badge-url]: ./LICENSE
