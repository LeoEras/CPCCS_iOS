//
//  Constants.swift
//  SleepingInTheLibrary
//
//  Created by Jarrod Parkes on 11/5/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

// MARK: - Constants

struct Constants {
    
    // MARK: CPCCS
    struct Cpccs {
        static let APIBaseURL = "http://custom-env.6v3gjmadmw.sa-east-1.elasticbeanstalk.com/"
    }
    struct Requests{
        static let getEstadosCiviles = "estados-civiles/"
        static let getProvincias = "provincias/"
        static let getCiudades = "ciudades/"
        
    }
    // MARK: CPCCS Response Values
    struct CpccsResponseKeys {
        static let Results = "results"
        static let Nombre = "nombre"
        static let Id = "id"
    }

    
}
