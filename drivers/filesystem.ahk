JoinPaths(paths*){
    separator := "\"

    result := ""

    for i, path in paths{
        if i == 1 {
            result := path
        } else if i == paths.Length{
            result .= separator . path
        } else{
            result .= path . separator
        }
    }

    return result
}
