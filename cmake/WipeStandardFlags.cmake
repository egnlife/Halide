function(wipe_standard_flags REGEX)
    get_property(IS_MULTI_CONFIG GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
    if (IS_MULTI_CONFIG)
        set(CONFIGS_TO_EDIT ${CMAKE_CONFIGURATION_TYPES})
    else ()
        set(CONFIGS_TO_EDIT ${CMAKE_BUILD_TYPE})
    endif ()

    get_property(ENABLED_LANGUAGES GLOBAL PROPERTY ENABLED_LANGUAGES)
    foreach (CFG IN LISTS CONFIGS_TO_EDIT)
        string(TOUPPER ${CFG} CFG_UPPER)
        foreach (L IN LISTS ENABLED_LANGUAGES)
            set(VAR CMAKE_${L}_FLAGS_${CFG_UPPER})
            string(REGEX REPLACE "(^| )${REGEX}($| )" " " ${VAR} "${${VAR}}")
            set(${VAR} "${${VAR}}" PARENT_SCOPE)
        endforeach ()
    endforeach ()
endfunction()