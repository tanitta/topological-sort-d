module topologicalsort;

E[] topologicalSort(E)(E[][] verticesList){
    return verticesList.generateGraphFromVerticesList.kahnSort;
}

unittest{
    auto verticesList = [[0, 1], [0, 2], [2, 3], [1, 3]];
    auto result = verticesList.topologicalSort;
    assert(result[0] == 0);
    assert(result[1] == 1 || result[1] == 2 && result[2] == 2 || result[2] == 1);
    assert(result[3] == 3);

}

unittest{
    auto NoDirectedAcyclicGraphVerticesList = [[0, 1], [1, 2], [2, 3], [3, 0]];
    auto result = NoDirectedAcyclicGraphVerticesList.topologicalSort;
    assert(result.length == 0);// Error, a directed cycle graph has no solution.
}

private class Node(T) {
    T container;
    Edge!T[] from;
    Edge!T[] to;
}//class Node

private class Edge(T) {
    Node!T from;
    Node!T to;
    bool isDeleted = false;
}//class Edge

import std.algorithm;
import std.array;

private auto generateGraphFromVerticesList(L)(L list){
    alias E = typeof(list[0][0]);
    Node!E[E] nodes;

    foreach (ref pair; list) {
        if(!nodes.keys.canFind(pair[0])){
            auto n = new Node!E();
            nodes[pair[0]] = n;
            nodes[pair[0]].container = pair[0];
        }

        if(!nodes.keys.canFind(pair[$-1])){
            auto n = new Node!E();
            nodes[pair[$-1]] = n;
            nodes[pair[$-1]].container = pair[$-1];
        }
        Edge!E edge = new Edge!E();
        edge.from = nodes[pair[0]];
        edge.to   = nodes[pair[$-1]];
        
        nodes[pair[0]].to ~= edge;
        nodes[pair[$-1]].from ~= edge;
    }
    return nodes.keys.map!(key => nodes[key])
              .filter!(node => node.from.length == 0)
              .array;
}

unittest{
    auto list = [[1, 2], [3, 4], [2, 4]];
    assert(list.generateGraphFromVerticesList.length == 2);
}

private T[] kahnSort(N:Node!T, T)(N[] graphs){
    N[] s = graphs;
    N[] l;
    while (s.length > 0) {
        auto n = s[0];
        if(s.length > 1){
            s = s[1 .. $];
        }else{
            s = [];
        }

        l ~= n;

        foreach (ref e; n.to.filter!(e => !e.isDeleted).array) {
            e.isDeleted = true;
            auto m = e.to;
            if(m.from.filter!(e => !e.isDeleted).array.length == 0) s ~= m;
        }
    }
    foreach (n; l) {
        if(n.from.filter!(e => !e.isDeleted).array.length > 0 || n.to.filter!(e => !e.isDeleted).array.length > 0) return [];
    }
    return l.map!(n => n.container).array;
}

