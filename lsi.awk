
#test the result and print any error
function gnzero(z,st)
{
        if ( z > 0 ){
               print  (st, z, "\n")
        }
}

# to get the Device Id
/Device Id/ { num += 1; device[num] = $3 }
# to get any Media Error
/Media Error Count/ { str_Media[num] = $4  }
# to get any Predictive Failure
/Predictive Failure Count/ { str_Predictive[num] = $4  }
# to get any Other Error
/Other Error Count/ { str_other[num] = $4  }

END{
        # FOR (1) to test all result
        for (i=1; i<=num; i+=1) {
                if ( str_Media[i] > 0 || str_Predictive[i] > 0 || str_other[i] > 0 )    {
                 gnzero(device[i],"Device Id =")
                 gnzero(str_Media[i],"Media Error Count=")
                 gnzero(str_Predictive[i],"Predictive Failure Count =")
                 gnzero(str_other[i],"Other Error Count=")


                        }
                }
}
