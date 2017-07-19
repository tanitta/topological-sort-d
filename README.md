topological-sort-d
====

[![Dub version](https://img.shields.io/dub/v/topological-sort.svg)](https://code.dlang.org/packages/topological-sort)
[![Dub downloads](https://img.shields.io/dub/dt/topological-sort.svg)](https://code.dlang.org/packages/topological-sort)

## Description

Perform topological sorting.

## Usage

```
import topologicalsort;

auto verticesList = [[0, 1], [0, 2], [2, 3], [1, 3]];
auto result = verticesList.topologicalSort; // [0, 1, 2, 3]
```
