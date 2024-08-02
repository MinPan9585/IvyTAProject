using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Player : MonoBehaviour
{

    public Rigidbody rd;
    public int score = 0;
    public Text scoreText;
    public GameObject winText;
    public GameObject particle;

    // Start is called before the first frame update
    void Start()
    {    //run only once
        //Debug.Log("Game Start");
        // = print
        rd = GetComponent<Rigidbody>();
    }

    // Update is called once per frame
    void Update()
    {
        //Debug.Log("Game Running");
        //(x,y,z) (1,0,0)
        //Vector3.right/left/forward/back/up/down
        //(10,0,0)
        //rd.AddForce(new Vector3(10, 0, 0));//Want force of 10N. Usually 1N
        //rd.AddForce(Vector3.right); //1N

        //control the object by keyboard
        //Unity -> Edit -> Project settings -> Axes so you can get the name  eg."Horizontal" for what key on keyboard
        float h = Input.GetAxis("Horizontal");//a -1, d 1 go left or right
        float v = Input.GetAxis("Vertical");//w s  go forward or backward
        //Debug.Log(h);
        //rd.AddForce(new Vector3(h, 0, v));
        rd.AddForce(new Vector3(h, 0, v) * 2); //(1, 2, 3) * 2 = (2, 4, 6) want to speed up





    }
    private void OnCollisionEnter(Collision collision) // collision check once
    {
        Debug.Log("Collision happan OnCollisionEnter");

        //collision.collider.tag      get tag 

        if (collision.gameObject.tag == "Food") //eat food using collision, but not smooth when eat it.
        {
            Destroy(collision.gameObject);
            
        }

    }
    //    private void OnCollisionExit(Collision collision)
    //    {
    //        Debug.Log("Collision happan OnCollisionExit");
    //    }
    //    private void OnCollisionStay(Collision collision)
    //    {
    //        Debug.Log("Collision happan OnCollisionStay");
    //    }  ctrl k + ctrl c È«²¿×¢ÊÍ






    private void OnTriggerEnter(Collider other) // other = this
    {
        //Debug.Log("OnTriggerEnter" + other.tag);

        if (other.tag == "Food") //eat food using collision, but not smooth when eat it.
        {
            Instantiate(particle, other.transform.position, Quaternion.identity); //particle effect
            Destroy(other.gameObject);
            score++;

            scoreText.text = "Points:" + score;

            if (score == 9)
            {
                winText.SetActive(true);
            }
        }
    }

    //private void OnTriggerExit(Collider other)
    //{
    //    Debug.Log("OnTriggerExit" + other.tag);

    //}

    //private void OnTriggerStay(Collider other)
    //{
    //    Debug.Log("OnTriggerStay" + other.tag);
    //}
}
