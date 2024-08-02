using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Food : MonoBehaviour //food rotation
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        transform.Rotate(Vector3.up); //roate 1 degree by 1 degree / 1 second
    }
}
