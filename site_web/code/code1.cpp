float average(vector<float>& v) {
    float sum = std::accumualte(v.begin(), v.end());
    return sum / v.size();
}

