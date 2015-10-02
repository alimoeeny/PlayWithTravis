//
//  Utils.swift
//  PlayWithTravis
//
//  Created by Ali Moeeny on 10/2/15.
//  Copyright © 2015 Ali Moeeny. All rights reserved.
//

import Foundation

// Returns sum of all items in all arrays for all keys in a dictionary of arrays.
// This is called MultiplexedCount instead of TotalItemCount or SumOfCounts or things like that
// because this is used in the Multiplex func below
func MultiplexedCount<T,U>(dictionaryOfArrays:[T:[U]]) -> Int {
    var count = 0
    for key in dictionaryOfArrays.keys {
        if let arr = dictionaryOfArrays[key] {
            count += arr.count
        }
    }
    return count
}

// Similar to the function above except that it only takes into account arrays for keys that in the in includeOnlyKeys
// and ignores the rest
func MultiplexedCount<T,U>(dictionaryOfArrays:[T:[U]], includeOnlyKeys:[T]) -> Int {
    var count = 0
    for key in includeOnlyKeys {
        if let arr = dictionaryOfArrays[key] {
            count += arr.count
        }
    }
    return count
}

// Motivation: in the bootstrap UI, it is desirable to mix/shuffle troves from different topic to keep it interesting
// instead of showing all political troves one after the other, then going to all science troves, this way we have a mix
// Instead of creating a shuffeled array and then reading from it, this method shuffles on the fly, this way it even works efficiently if/as items are being appeneded to the end of each array concurrently
// Multiplex, basically picks one item at a time from each array in a dictionary of arrays. It return a single item at the nominal index of nominalIndex (as if it was all rearranged in one single shuffeled array). See the test case to get a better understanding.
func Multiplex<T,U>(dictionaryOfArrays:[T:[U]], nominalIndex:Int, includOnlyKeys:[T]) -> U? {
    var scanner = 0
    var rowpointer = 0
    let totalcount =  MultiplexedCount(dictionaryOfArrays, includeOnlyKeys: includOnlyKeys)
    while scanner < totalcount {
        for key in includOnlyKeys {
            if let items = dictionaryOfArrays[key] {
                if items.count > rowpointer {
                    if scanner == nominalIndex {
                        return items[rowpointer]
                    }
                    scanner += 1
                }
            }
        }
        rowpointer += 1
    }
    return nil
}

// If instead of shuffled items, we want to concatenate all the arrays in a dictionary of arrays we use Scan instead of Shuffle
func Scan<T,U>(dictionaryOfArrays:[T:[U]], nominalIndex:Int, includOnlyKeys:[T]) -> U? {
    var counter = 0
    for key in includOnlyKeys {
        if let items = dictionaryOfArrays[key] {
            for item in items {
                if counter == nominalIndex {
                    return item
                }
                counter += 1
            }
        }
    }
    return nil
}


func removeObject<T : Equatable>(object: T, inout fromArray array: [T])
{
    let index = array.indexOf(object)
    array.removeAtIndex(index!)
}