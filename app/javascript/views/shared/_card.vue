<template>
    <q-card class="my-card">
        <q-card-section horizontal>
            <q-img class="col-5" src="https://cdn.quasar.dev/img/parallax1.jpg" />
    
            <q-card-section>
                {{ description }}
            </q-card-section>
        </q-card-section>
    
        <q-separator />
    
        <div class="row flex-center justify-between q-pa-sm">
            <div class="col q-pr-sm gt-sm" align="right">
                <q-btn flat dense round icon="event" />
                <q-btn flat dense color="primary">
                    Reserve
                </q-btn>
            </div>
            <div class="col q-pr-sm lt-md" align="center">
                <q-btn flat dense round icon="event" />
                <q-btn flat dense color="primary">
                    Reserve
                </q-btn>
            </div>
        </div>
    </q-card>
</template>


<script>
export default {

    setup() {
        const description = "This is a placeholder text that can be changed."
        return {
            description
        }
    }
}
</script>


<style lang="">
    
</style>