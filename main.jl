function read_file(name::String)
    try
        file = open(name, "r")
        line_by_line = readlines(file)
        return line_by_line[1]
    catch error
        println("El archivo $name no existe o no esta en la direccion propuesta.")
        exit()
    end
end


function look_adedinas_or_cytokines(data:: String, character::Char)
    count = 0
    for protein in data
        if protein == character
            count += 1
            if count >= 2
                return true
            end
        else
            count = 0
        end
    end
    return false
end


function look_for_guanines(protein_data::String)
    count = 0
    for protein in protein_data
        if protein == 'g'
            count += 1
            if count >= 3
                return false
            end
        else
            count = 0
        end
    end
    return true
end


function look_for_thymine(protein_data::String)
    if protein_data[end] == 't'
        return true
    else
        return false
    end
end


function analyze_data(data::String)
    if data == ""
        println("Esta vacio y no se puede trabajar con esto.")
    elseif look_for_thymine(data) && look_for_guanines(data) && (look_adedinas_or_cytokines(data, 'a') || look_adedinas_or_cytokines(data, 'a') )
        println("Es mutante.")
    else
        println("Es humano.")
    end
end


function main()
    print("Ingrese el nombre del archivo: ")
    name_file = readline()
    protein_data = read_file(name_file)
    analyze_data(protein_data)
    # touch(name_file) # este comando es util para crear archivos 
end


main()
