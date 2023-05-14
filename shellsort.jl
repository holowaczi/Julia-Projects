function shell_sort(array, gap)
    i = 1
    while gap > 0
        while i+(gap+1)<=length(array)
            if array[i]>array[i+(gap+1)]
                array[i],array[i+(gap+1)] = array[i+(gap)+1],array[i]
            end
            i += 1
        end
        gap -= 1
    end
    for i in 2:length(array)
        j = i-1
        while array[j]>array[j+1] && j>1
            array[j],array[j+1] = array[j+1],array[j]
            j -= 1
        end
        if array[j]>array[j+1]
            array[j],array[j+1] = array[j+1],array[j]
        end
    end
    return array
end

data = rand(1:100,30)

println(data)
println(shell_sort(data, 15))